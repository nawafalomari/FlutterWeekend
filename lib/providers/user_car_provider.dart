import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weekend/data/repos/user_repo.dart';
import 'package:flutter_weekend/domain/models/car.dart';
import 'package:flutter_weekend/providers/user_provider.dart';

final userCarProvider = FutureProvider<Car?>((ref) async {
  final user = await ref.watch(userProvider.future);
  if (user != null && user.carId != null) {
    return ref.read(userRepoProvider).fetchCarByid(user.carId!);
  } else {
    return null;
  }
});
