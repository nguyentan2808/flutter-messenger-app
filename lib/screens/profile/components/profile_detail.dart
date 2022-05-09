import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';
import '../../../models/user_model.dart';

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
            text: "@" + user.username,
            icon: Icons.person,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: "profile_name".tr,
            text: user.name,
            icon: Icons.verified_user_rounded,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: "profile_email".tr,
            text: user.email,
            icon: Icons.email,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: "profile_phone".tr,
            text: user.phone,
            icon: Icons.phone,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: "profile_status".tr,
            text: user.status,
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
      {Key? key, required this.title, required this.text, required this.icon})
      : super(key: key);

  final String title;
  final String text;
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
            child: text != ""
                ? Text(
                    text,
                    style: const TextStyle(
                        fontSize: 15.0, overflow: TextOverflow.ellipsis),
                  )
                : const Text(
                    "(No data)",
                    style: TextStyle(
                      fontSize: 13.0,
                      overflow: TextOverflow.ellipsis,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
