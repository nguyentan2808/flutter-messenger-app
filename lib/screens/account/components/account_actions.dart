import 'package:flutter/material.dart';

import '../../../components/facebook_button.dart';
import '../../../constant.dart';
import '../../../models/user_model.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({Key? key, required this.user, required this.isMe})
      : super(key: key);

  final UserModel user;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          child: Text(
            user.name,
            style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1?.color,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 20,
              child: isMe
                  ? const FaceBookButton(
                      text: "Edit profile",
                      icon: Icons.edit_rounded,
                      isActive: true)
                  : Row(
                      children: const [
                        Expanded(
                            child: FaceBookButton(
                                text: "Thêm bạn bè",
                                icon: Icons.person_add,
                                isActive: true)),
                        SizedBox(width: kDefaultPadding / 2),
                        Expanded(
                            child: FaceBookButton(
                                text: "Nhắn tin",
                                icon: Icons.send,
                                isActive: false))
                      ],
                    ),
            ),
            const SizedBox(width: kDefaultPadding / 2),
            const Expanded(
              flex: 3,
              child: FaceBookButton(
                  text: "", icon: Icons.more_horiz, isActive: false),
            ),
          ],
        )
      ],
    );
  }
}
