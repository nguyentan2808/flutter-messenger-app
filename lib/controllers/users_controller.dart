import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UsersController extends GetxController {
  var users = <UserModel>[].obs;

  void fetchUsers() async {
    try {
      final response = await Dio()
          .get('https://62719cc6c455a64564b59721.mockapi.io/api/users');

      final List<UserModel> _users = response.data
          .map<UserModel>((user) => UserModel.fromJson(user))
          .toList();

      users.value = _users;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
