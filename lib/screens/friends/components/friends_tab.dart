import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/index.dart';
import '../../../components/notification.dart';
import '../../../models/user_model.dart';
import 'row_item.dart';

class FriendsTab extends StatefulWidget {
  const FriendsTab({Key? key}) : super(key: key);

  @override
  State<FriendsTab> createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  List<UserModel> users = [];

  Future fetchUsers() async {
    try {
      var response = await API().fetchAllUser();
      var usersJSON = response.data['users'];

      List<UserModel> result = [];

      for (int i = 0; i < usersJSON.length; i++) {
        result.add(UserModel.fromJson(usersJSON[i]));
      }

      if (mounted) {
        setState(() => users = result);
      }
    } catch (error) {
      NotificationDialog.show(context, "Error", error.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future _onRefresh() async {
    API().fetchAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: users.isNotEmpty
          ? RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return RowItem(user: users[index]);
                },
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
