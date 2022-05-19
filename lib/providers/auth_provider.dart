import 'package:flutter/material.dart';
import 'package:lab6/models/user_model.dart';

class Auth with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  void initUser(user) => _user = user;

  void setUser(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  void setAvatar(String url) {
    _user?.avatar = url;
    notifyListeners();
  }

  void setCoverPhoto(String url) {
    _user?.coverPhoto = url;
    notifyListeners();
  }
}
