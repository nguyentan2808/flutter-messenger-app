import 'package:flutter/material.dart';
import 'package:lab6/models/user_model.dart';

class Auth with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  void setUser(UserModel? user) => _user = user;
}
