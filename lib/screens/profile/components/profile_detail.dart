import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/models/user_model.dart';

import '../../../constants/theme_constant.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Column(
        children: [
          DetailRow(
            title: "profile_username".tr,
            content: "@" + user.username,
            icon: Icons.person,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: "profile_name".tr,
            content: user.name,
            icon: Icons.verified_user_rounded,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: "profile_email".tr,
            content: user.email,
            icon: Icons.email,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: "profile_phone".tr,
            content: user.phone,
            icon: Icons.phone,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: "profile_status".tr,
            content: user.status ?? "",
            icon: Icons.edit,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  const DetailRow(
      {Key? key,
      required this.title,
      required this.content,
      required this.icon})
      : super(key: key);

  final String title;
  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.grey.withOpacity(0.8),
              size: 22,
            ),
            const SizedBox(width: kDefaultPadding / 2),
            Text(
              title,
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(width: kDefaultPadding * 3),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              content,
              style: const TextStyle(
                  fontSize: 15.0, overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
      ],
    );
  }
}
