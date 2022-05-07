import 'package:flutter/material.dart';

import '../../../constants/theme_constant.dart';

class MessageTime extends StatelessWidget {
  const MessageTime({
    Key? key,
    required this.isShowDetail,
    required this.isMe,
  }) : super(key: key);

  final bool isShowDetail;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: isShowDetail ? null : 0.0,
        padding: EdgeInsets.only(
            bottom: kDefaultPadding / 5,
            left: isMe ? 0 : 40,
            right: isMe ? 28 : 0),
        child: const Text(
          "15 THG 4 Lúc 10:42",
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
