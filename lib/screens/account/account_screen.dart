import 'package:flutter/material.dart';
import 'package:lab6/constant.dart';
import 'package:lab6/models/user_model.dart';
import 'package:lab6/screens/account/components/account_friends.dart';

import 'components/account_actions.dart';
import 'components/account_detail.dart';
import 'components/account_images.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  UserModel user = UserModel(
    id: "1",
    username: "nguyentan2808",
    name: "Nguyen Tan",
    email: "519H0229@student.tdtu.edu.vn",
    phone: "0333571180",
    avatar: '',
    coverPhoto: "",
    status: 'Deadline season is coming',
  );

  bool isMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding * 2 / 3),
          child: Column(
            children: [
              // AccountPreview(),
              AccountImages(
                user: user,
              ),
              AccountActions(
                user: user,
                isMe: isMe,
              ),
              Divider(
                color: Colors.grey[400],
              ),
              AccountDetail(
                user: user,
              ),
              Divider(
                color: Colors.grey[400],
              ),
              AccountFriends(
                user: user,
              )
            ],
          ),
        ),
      ),
    );
  }
}
