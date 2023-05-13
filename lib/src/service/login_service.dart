import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/src/repository/login_repository.dart';
import 'package:my_app/src/model/user_model.dart';

class LoginService extends StateNotifier<UserModel?> {
  final Ref ref;
  final LoginRepository repository;

  LoginService({
    required this.ref,
    required this.repository,
    required UserModel? user,
  }) : super(user);

  Future<bool> login(String userName, String password) async {
    UserModel? user = await repository.login(userName, password);

    if (user != null) state = user;

    return Future(() => user != null);
  }

  Future<bool> logoff() async {
    state = null;

    return Future(() => state == null);
  }
}

final loginProvider = StateNotifierProvider<LoginService, UserModel?>(
  (ref) {
    return LoginService(
      ref: ref,
      repository: ref.watch(loginRepositoryProvider),
      user: null,
    );
  },
);
