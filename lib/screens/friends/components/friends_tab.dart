import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../api/index.dart';
import '../../../components/notification.dart';
import '../../../models/user_model.dart';
import '../../../providers/friends_provider.dart';
import '../../../services/friends_service.dart';
import 'row_item.dart';

class FriendsTab extends StatefulWidget {
  const FriendsTab({Key? key}) : super(key: key);

  @override
  State<FriendsTab> createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  Future fetchFriends() async {
    try {
      FriendsService(context).fetchFriends();
    } catch (e) {
      NotificationDialog.show(context, "Error", e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFriends();
  }

  Future _onRefresh() async {
    API().fetchAllUser();
  }

  @override
  Widget build(BuildContext context) {
    List<UserModel> users = context.watch<FriendsProvider>().users;

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
