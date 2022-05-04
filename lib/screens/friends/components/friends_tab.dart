import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/controllers/users_controller.dart';

import 'row_item.dart';

class FriendsTab extends StatefulWidget {
  const FriendsTab({Key? key}) : super(key: key);

  @override
  State<FriendsTab> createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  final UsersController _usersController = Get.put(UsersController());

  @override
  void initState() {
    super.initState();
    _usersController.fetchUsers();
  }

  Future _onRefresh() async {
    _usersController.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Obx(
        () => _usersController.users.isNotEmpty
            ? RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: _usersController.users.length,
                  itemBuilder: (context, index) {
                    final user = _usersController.users[index];
                    return RowItem(user: user);
                  },
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
