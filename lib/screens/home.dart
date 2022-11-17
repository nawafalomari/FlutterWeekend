import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weekend/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String uid = 'user1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("Users").doc(uid).get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data!['name'].toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    width: 300,
                    height: 200,
                    child: TextField(
                      decoration: const InputDecoration(hintText: "Enter Uid"),
                      onSubmitted: (value) {
                        setState(() {
                          uid = value;
                        });
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
            } else {
              return const Text("loading");
            }
          },
        ),
      ),
    );
  }
}
