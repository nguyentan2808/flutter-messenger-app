import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/facebook_button.dart';
import '../../../constants/routes_constant.dart';
import '../../../constants/theme_constant.dart';
import '../../../models/user_model.dart';

enum Relationship { friend, pending, none }

class ProfileActions extends StatefulWidget {
  const ProfileActions({Key? key, required this.user, required this.isMe})
      : super(key: key);

  final UserModel user;
  final bool isMe;

  @override
  State<ProfileActions> createState() => _ProfileActionsState();
}

class _ProfileActionsState extends State<ProfileActions> {
  late Relationship relationship;

  @override
  void initState() {
    super.initState();
    setState(() => relationship = Relationship.friend);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          child: Text(
            widget.user.name,
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
              child: widget.isMe
                  ? FaceBookButton(
                      text: "profile_edit".tr,
                      icon: Icons.edit_rounded,
                      isActive: true,
                      onPressed: () {
                        Get.toNamed(Routes.editProfile, arguments: widget.user);
                      },
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: relationship == Relationship.none
                              ? FaceBookButton(
                                  text: "profile_add_friend".tr,
                                  icon: Icons.person_add,
                                  isActive: true,
                                  onPressed: () {
                                    setState(() {
                                      relationship = Relationship.pending;
                                    });
                                  },
                                )
                              : relationship == Relationship.pending
                                  ? FaceBookButton(
                                      text: "Hủy lời mời",
                                      icon: Icons.cancel,
                                      isActive: true,
                                      onPressed: () {
                                        setState(() {
                                          relationship = Relationship.none;
                                        });
                                      },
                                    )
                                  : FaceBookButton(
                                      text: "Bạn bè",
                                      icon: Icons.check,
                                      isActive: true,
                                      onPressed: () {
                                        setState(() {
                                          relationship = Relationship.none;
                                        });
                                      },
                                    ),
                        ),
                        const SizedBox(width: kDefaultPadding / 2),
                        Expanded(
                          flex: 1,
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
