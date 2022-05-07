import 'package:flutter/material.dart';

import '../../../constants/theme_constant.dart';

class MessageAvatar extends StatelessWidget {
  const MessageAvatar({
    Key? key,
    required this.isMe,
    required this.isShowAvatar,
  }) : super(key: key);

  final bool isMe;
  final bool isShowAvatar;

  @override
  Widget build(BuildContext context) {
    if (!isMe) {
      return Container(
        padding: const EdgeInsets.only(right: kDefaultPadding / 2),
        child: CircleAvatar(
          backgroundImage: isShowAvatar
              ? const AssetImage("assets/images/avatar.jpg")
              : null,
          backgroundColor: Colors.transparent,
          radius: 14,
        ),
      );
    } else {
      return Container();
    }
  }
}
