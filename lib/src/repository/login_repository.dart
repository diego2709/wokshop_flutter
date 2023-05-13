// ignore: depend_on_referenced_packages
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/src/model/user_model.dart';
import 'package:my_app/src/repository/repository_model.dart';

class LoginRepository extends ModelRepository {
  Future<UserModel?> login(String userName, String password) async {
    UserModel? user;

    try {
      String uri =
          'https://b2425c80-36d7-4c43-a19f-1408fba865ae.mock.pstmn.io/login/$userName/$password';

      var response = await super.get(uri);

      final parsed = jsonDecode(response.toString());
      user = UserModel.fromJson(parsed);
    } catch (e) {
      // print('Exception: ${e}');
      // throw Exception(e);
    }

    return Future(() => user);
  }
}

final loginRepositoryProvider = Provider((ref) => LoginRepository());
