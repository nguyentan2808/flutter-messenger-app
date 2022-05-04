import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/models/user_model.dart';

import '../../../constant.dart';
import '../../../controllers/users_controller.dart';
import '../account_screen.dart';

class AccountFriends extends StatelessWidget {
  AccountFriends({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  final UsersController _usersController = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: kDefaultPadding / 3, bottom: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Friends",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "479 friends",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              const Text(
                "View all",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: kDefaultPadding / 2 + 2,
            mainAxisSpacing: kDefaultPadding / 2 + 2,
            crossAxisCount: 3,
            childAspectRatio: (0.9),
          ),
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            UserModel currentUser = _usersController
                .users[Random().nextInt(_usersController.users.length - 1)];
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => const AccountScreen(),
                  arguments: currentUser,
                  transition: Transition.rightToLeftWithFade,
                  preventDuplicates: false,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: currentUser.avatar as String,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Text(currentUser.name),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
