import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weekend/providers/gloable_providers.dart';
import 'package:flutter_weekend/providers/user_provider.dart';
import 'package:flutter_weekend/screens/second_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String uid = 'user1';

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);
    return Scaffold(
      body: Center(
        child: userState.when(data: (userData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userData?.name ?? "No user logged in",
                style: const TextStyle(fontSize: 30),
              ),
              SizedBox(
                width: 300,
                height: 200,
                child: TextField(
                  decoration: const InputDecoration(hintText: "Enter Uid"),
                  onSubmitted: (value) {
                    ref.read(uidProvider.notifier).state = value;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => const SecondScreen(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  child: const Text("Next Screen"))
            ],
          );
        }, error: (error, stackTrace) {
          return const Text("User dose not exist");
        }, loading: () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text("Loading"),
            ],
          );
        }),
      ),
    );
  }
}


// FutureBuilder(
//           future: FirebaseFirestore.instance.collection("Users").doc(uid).get(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Text(snapshot.error.toString());
//             }
//             if (snapshot.connectionState == ConnectionState.done) {
              // return Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       snapshot.data!['name'].toString(),
              //       style: const TextStyle(fontSize: 30),
              //     ),
              //     SizedBox(
              //       width: 300,
              //       height: 200,
              //       child: TextField(
              //         decoration: const InputDecoration(hintText: "Enter Uid"),
              //         onSubmitted: (value) {
              //           setState(() {
              //             uid = value;
              //           });
              //         },
              //       ),
              //     ),
              //     ElevatedButton(
              //         onPressed: () {
              //           Navigator.pushReplacement(
              //             context,
              //             PageRouteBuilder(
              //               pageBuilder: (context, animation1, animation2) => const SecondScreen(),
              //               transitionDuration: Duration.zero,
              //               reverseTransitionDuration: Duration.zero,
              //             ),
              //           );
              //         },
              //         child: const Text("Next Screen"))
              //   ],
              // );
//             } else {
//               return const Text("loading");
//             }
//           },
//         )
