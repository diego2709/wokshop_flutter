import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/src/service/login_service.dart';

class LoginState {
  final GlobalKey<FormState> formKey;
  String userName;
  String password;
  bool showPassword;

  LoginState({
    GlobalKey<FormState>? formKey,
    String? userName,
    String? password,
    bool? showPassword,
  })  : formKey = formKey ?? GlobalKey<FormState>(),
        userName = userName ?? '',
        password = password ?? '',
        showPassword = showPassword ?? false;

  LoginState copyWith({
    GlobalKey<FormState>? formKey,
    String? userName,
    String? password,
    bool? showPassword,
  }) {
    return LoginState(
      formKey: formKey ?? this.formKey,
      userName: userName ?? this.userName,
      password: password ?? this.userName,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}

class LoginController extends StateNotifier<LoginState> {
  final Ref ref;

  LoginController({
    required this.ref,
  }) : super(LoginState());

  set userName(String value) {
    state.userName = value;
  }

  set password(String value) {
    state.password = value;
  }

  toogleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  Future<bool> login() async {
    return ref.read(loginProvider.notifier).login(
          state.userName,
          state.password,
        );
  }
}

final loginController =
    StateNotifierProvider.autoDispose<LoginController, LoginState>(
  (ref) {
    return LoginController(
      ref: ref,
    );
  },
);
