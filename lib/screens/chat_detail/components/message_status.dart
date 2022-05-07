import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageStatus extends StatelessWidget {
  const MessageStatus({
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
        padding: EdgeInsets.only(left: isMe ? 0 : 42, right: isMe ? 28 : 0),
        child: Text(
          isMe ? "chat_detail_sended".tr : "chat_detail_seen".tr,
          style: const TextStyle(fontSize: 11),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
