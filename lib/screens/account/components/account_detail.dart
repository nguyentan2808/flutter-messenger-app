import 'package:flutter/material.dart';
import 'package:lab6/models/user_model.dart';

import '../../../constant.dart';

class AccountDetail extends StatelessWidget {
  const AccountDetail({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Column(
        children: [
          DetailRow(
            title: 'User name',
            content: "@" + user.username,
            icon: Icons.person,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: 'Name',
            content: user.name,
            icon: Icons.verified_user_rounded,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: 'Email',
            content: user.email,
            icon: Icons.email,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: 'Phone',
            content: user.phone,
            icon: Icons.phone,
          ),
          const SizedBox(height: kDefaultPadding * 1.3),
          DetailRow(
            title: 'Status',
            content: user.status,
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
        Text(
          content,
          style: const TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }
}
