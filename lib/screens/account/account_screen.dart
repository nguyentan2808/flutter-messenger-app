import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constant.dart';
import 'package:lab6/models/user_model.dart';
import 'package:lab6/screens/account/components/account_friends.dart';

import '../../controllers/auth_controller.dart';
import 'components/account_actions.dart';
import 'components/account_detail.dart';
import 'components/account_images.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final AuthController _authController = Get.find<AuthController>();

  UserModel? user = Get.arguments;
  bool isMe = false;

  @override
  void initState() {
    super.initState();

    user ??= _authController.getUser;
    isMe = user!.username == _authController.getUser.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user!.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding * 2 / 3),
            child: Column(
              children: [
                AccountImages(user: user as UserModel),
                AccountActions(user: user as UserModel, isMe: isMe),
                Divider(color: Colors.grey[400]),
                AccountDetail(user: user as UserModel),
                Divider(color: Colors.grey[400]),
                AccountFriends(user: user as UserModel)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
