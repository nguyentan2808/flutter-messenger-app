import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constants/theme_constant.dart';
import '../../models/user_model.dart';
import '../../providers/auth_provider.dart';
import 'components/profile_actions.dart';
import 'components/profile_detail.dart';
import 'components/profile_friends.dart';
import 'components/profile_images.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  UserModel? user = Get.arguments;
  bool isMe = false;

  @override
  Widget build(BuildContext context) {
    user ??= context.watch<Auth>().user;
    isMe = context.watch<Auth>().user?.username == user?.username;

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
                ProfileImages(user: user as UserModel, isMe: isMe),
                ProfileActions(user: user as UserModel, isMe: isMe),
                Divider(color: Colors.grey[400]),
                ProfileDetail(user: user as UserModel),
                Divider(color: Colors.grey[400]),
                ProfileFriends(user: user as UserModel)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
