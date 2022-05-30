import 'package:flutter/cupertino.dart';
import 'package:lab6/providers/friends_provider.dart';
import 'package:provider/provider.dart';

import '../api/index.dart';
import '../models/user_model.dart';

class FriendsService {
  final BuildContext context;
  final API api = API();

  FriendsService(this.context);

  Future fetchFriends() async {
    var response = await API().fetchAllUser();
    var usersJSON = response.data['users'];

    List<UserModel> result = [];

    for (int i = 0; i < usersJSON.length; i++) {
      result.add(UserModel.fromJson(usersJSON[i]));
    }

    context.read<FriendsProvider>().updateFriends(result);
  }
}
