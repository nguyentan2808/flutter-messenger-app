import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/facebook_button.dart';
import '../../../constants/routes_constant.dart';
import '../../../constants/theme_constant.dart';
import '../../../models/user_model.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({Key? key, required this.user, required this.isMe})
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
                  ? FaceBookButton(
                      text: "profile_edit".tr,
                      icon: Icons.edit_rounded,
                      isActive: true,
                      onPressed: () {
                        Get.toNamed(Routes.editProfile, arguments: user);
                      },
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: FaceBookButton(
                            text: "profile_add_friend".tr,
                            icon: Icons.person_add,
                            isActive: true,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding / 2),
                        Expanded(
                          child: FaceBookButton(
                            text: "profile_message".tr,
                            icon: Icons.send,
                            isActive: false,
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
            ),
            const SizedBox(width: kDefaultPadding / 2),
            Expanded(
              flex: 3,
              child: FaceBookButton(
                text: "",
                icon: Icons.more_horiz,
                isActive: false,
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
