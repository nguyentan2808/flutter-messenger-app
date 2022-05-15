import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../api/index.dart';
import '../models/user_model.dart';
import '../providers/auth_provider.dart';
import 'google_signin_service.dart';

class AuthService {
  static final GoogleSignInService googleService = GoogleSignInService();
  static API api = API();
  static GetStorage localStorage = GetStorage();

  Future<void> googleLogin(BuildContext context) async {
    final idToken = await GoogleSignInService.getTokenId();

    if (idToken != null) {
      var response = await api.googleLogin(idToken);

      var user = UserModel.fromJson(response.data['user']);
      localStorage.write("user", user.toJson()); //Save user to local storage

      context.read<Auth>().setUser(user);
    } else {
      throw ("Some thing went wrong");
    }
  }

  Future<void> signUp(
    BuildContext context, {
    required String username,
    required String password,
    required String name,
    required String email,
    required String phone,
    required String birthday,
  }) async {
    await api.signUp(
      username: username,
      password: password,
      name: name,
      email: email,
      phone: phone,
      birthday: birthday,
    );
  }

  Future<void> localLogin(
      BuildContext context, String username, String password) async {
    var response = await api.localLogin(username: username, password: password);

    String token = response.data['token'];

    var user = UserModel.fromJson(response.data['user']);
    localStorage.write("user", user.toJson());
    localStorage.write("token", token);

    context.read<Auth>().setUser(user);
  }

  void loginWithMockData(BuildContext context) {
    const json =
        '{"user":{"_id":"6278e416261473307cb3bcec","username":"nguyentan08.it","name":"Tân Nguyễn Xuân","email":"nguyentan08.it@gmail.com","phone":"","status":"","gender":"male","avatar":"https://lh3.googleusercontent.com/a-/AOh14GjpGe4CWZxlPMm6T3AnsOrm0cGzSFHf7sd7JvgD=s96-c","coverPhoto":"","isPrivate":false,"createdAt":"2022-05-09T09:51:18.073Z","updatedAt":"2022-05-09T09:51:18.073Z","__v":0}}';
    var decode = jsonDecode(json);

    var user = UserModel.fromJson(decode['user']);
    context.read<Auth>().setUser(user);
  }

  Future<void> logOut(BuildContext context) async {
    await googleService.signOut();
    context.read<Auth>().setUser(null);
    localStorage.remove("user");
    localStorage.remove("token");
  }
}
