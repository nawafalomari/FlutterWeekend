import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weekend/domain/models/car.dart';
import 'package:flutter_weekend/domain/models/user.dart';

final userRepoProvider = Provider<UserRepo>((ref) {
  return UserRepo();
});

class UserRepo {
  Future<User> fetchUserByUid(String uid) async {
    try {
      final userDoc = await FirebaseFirestore.instance.collection("Users").doc(uid).get();
      if (userDoc.exists && userDoc.data() != null) {
        return User.fromMap(userDoc.data()!);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  Future<Car> fetchCarByid(String carId) async {
    try {
      final carDoc = await FirebaseFirestore.instance.collection("UserCars").doc(carId).get();
      if (carDoc.exists && carDoc.data() != null) {
        return Car.fromMap(carDoc.data()!);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      log('$e');
      rethrow;
    }
  }
}
