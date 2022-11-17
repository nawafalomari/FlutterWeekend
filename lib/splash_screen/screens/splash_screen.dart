import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_weekend/firebase_options.dart';
import 'package:flutter_weekend/screens/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          log(snapshot.error.toString());
          return Container(
            child: const Text("error"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Future.microtask(() => Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => const HomeScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              ));
          return Container(
            child: const Text("done"),
          );
        }
        return Container(
          child: const Text("loading"),
        );
      },
    );
  }
}
