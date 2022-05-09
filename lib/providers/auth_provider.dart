import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lab6/models/user_model.dart';
import '../api/index.dart';

class Auth with ChangeNotifier {
  static API api = API();

  UserModel? _user;
  UserModel? get user => _user;

  void setUser(UserModel? user) => _user = user;

  Future<void> googleLogin(String idToken) async {
    var response = await api.login(idToken);

    var user = UserModel.fromJson(response.data['user']);
    GetStorage().write("user", user.toJson());

    _user = user;
    notifyListeners();
  }
}
