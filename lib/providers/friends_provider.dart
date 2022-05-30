import 'package:flutter/material.dart';

import '../models/user_model.dart';

class FriendsProvider with ChangeNotifier {
  List<UserModel> _users = [];

  get users => _users;

  void updateFriends(List<UserModel> users) {
    _users = users;
    notifyListeners();
  }
}
