import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';

import '../../../models/conversation_model.dart';
import '../../../models/message_model.dart';
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
    required this.conversation,
  }) : super(key: key);

  final MessageModel message;
  final bool isMe;
  final bool isShowAvatar;
  final ConversationModel? conversation;

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
      menuBuilder: () => !isMe
          ? MenuReaction(
              controller: _reactionController, message: widget.message)
          : Container(),
      child: GestureDetector(
        onTap: _handleShowDetail,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  MessageTime(
                    isShowDetail: isShowDetail,
                    isMe: isMe,
                    time: widget.message.createdAt,
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              MessageAvatar(
                                  isMe: isMe,
                                  isShowAvatar: widget.isShowAvatar,
                                  message: widget.message,
                                  conversation: widget.conversation),
                              MessageContent(
                                  isMe: isMe, message: widget.message),
                            ],
                          ),
                          widget.message.reaction != ""
                              ? const SizedBox(height: 9)
                              : Container()
                        ],
                      ),
                      widget.message.reaction != ""
                          ? Positioned(
                              right: isMe ? null : 4,
                              left: isMe ? 4 : null,
                              bottom: 0,
                              child: Image.asset(
                                widget.message.reaction,
                                height: 18,
                                width: 18,
                              ),
                            )
                          : Container()
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
