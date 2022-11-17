import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weekend/data/repos/user_repo.dart';
import 'package:flutter_weekend/providers/gloable_providers.dart';

import '../domain/models/user.dart';

final userProvider = FutureProvider<User?>((ref) async {
  final uid = ref.watch(uidProvider);

  ///No user is logged in
  if (uid != null) {
    return ref.read(userRepoProvider).fetchUserByUid(uid);
  } else {
    return null;
  }
});
