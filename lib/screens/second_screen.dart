import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weekend/providers/user_car_provider.dart';
import 'package:flutter_weekend/providers/user_provider.dart';
import 'package:flutter_weekend/screens/home.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: ((context, ref, child) {
              final user = ref.watch(userProvider);
              return user.when(data: ((data) {
                return ElevatedButton(onPressed: data != null ? doSomething : null, child: const Text("Hello"));
              }), error: ((error, stackTrace) {
                return const SizedBox.shrink();
              }), loading: () {
                return Column(
                  children: const [CircularProgressIndicator()],
                );
              });
            })),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => const HomeScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                child: const Text("Go Home")),
            Consumer(builder: ((context, ref, child) {
              return ref.watch(userCarProvider).when(data: (data) {
                return Text(data?.name ?? "No car");
              }, error: ((error, stackTrace) {
                return const SizedBox.shrink();
              }), loading: () {
                return Column(
                  children: const [CircularProgressIndicator()],
                );
              });
            }))
          ],
        ),
      ),
    );
  }

  void doSomething() {
    log("did something");
  }
}
