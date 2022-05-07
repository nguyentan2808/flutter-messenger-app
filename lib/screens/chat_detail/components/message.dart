import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';
import 'menu_reaction.dart';
import 'message_avatar.dart';
import 'message_content.dart';
import 'message_status.dart';
import 'message_time.dart';

class Message extends StatefulWidget {
  const Message({
    Key? key,
    required this.message,
    required this.isMe,
    required this.isShowAvatar,
  }) : super(key: key);

  final MessageModel message;
  final bool isMe;
  final bool isShowAvatar;

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  bool isShowDetail = false;
  final CustomPopupMenuController _reactionController =
      CustomPopupMenuController();

  void _handleShowDetail() {
    setState(() => isShowDetail = !isShowDetail);
  }

  @override
  Widget build(BuildContext context) {
    bool isMe = widget.isMe;

    return CustomPopupMenu(
      showArrow: false,
      verticalMargin: 0,
      horizontalMargin: 0,
      controller: _reactionController,
      barrierColor: Colors.transparent,
      pressType: PressType.longPress,
      menuBuilder: () =>
          !isMe ? MenuReaction(controller: _reactionController) : Container(),
      child: GestureDetector(
        onTap: _handleShowDetail,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  MessageTime(isShowDetail: isShowDetail, isMe: isMe),
                  Row(
                    children: [
                      MessageAvatar(
                          isMe: isMe, isShowAvatar: widget.isShowAvatar),
                      MessageContent(isMe: isMe, message: widget.message),
                    ],
                  ),
                  MessageStatus(isShowDetail: isShowDetail, isMe: isMe),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
