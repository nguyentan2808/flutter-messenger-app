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

  Future<void> googleLogin(BuildContext context) async {
    final idToken = await GoogleSignInService.getTokenId();

    if (idToken != null) {
      var response = await api.login(idToken);

      var user = UserModel.fromJson(response.data['user']);
      GetStorage().write("user", user.toJson()); //Save user to local storage

      context.read<Auth>().setUser(user);
    }
  }

  Future<void> logOut(BuildContext context) async {
    await googleService.signOut();
    context.read<Auth>().setUser(null);
    GetStorage().remove("user");
  }
}
