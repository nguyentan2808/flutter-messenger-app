import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/controllers/auth_controller.dart';
import 'package:lab6/controllers/messages_controller.dart';
import 'package:lab6/screens/chat_detail/models/message_model.dart';

import 'message.dart';

class MessageDisplay extends StatefulWidget {
  const MessageDisplay({Key? key, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  @override
  State<MessageDisplay> createState() => _MessageDisplayState();
}

class _MessageDisplayState extends State<MessageDisplay> {
  final AuthController _authController = Get.put(AuthController());

  final MessagesController _messagesController = Get.put(MessagesController());

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      widget.scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          reverse: true,
          controller: widget.scrollController,
          itemCount: _messagesController.messages.length,
          itemBuilder: (context, index) {
            final MessageModel message = _messagesController.messages[index];
            final bool isMe =
                message.sender == _authController.user.value.username;
            bool isShowAvatar;

            if (index == 0) {
              isShowAvatar = true;
            } else {
              final MessageModel nextMessage =
                  _messagesController.messages[index - 1];
              isShowAvatar = message.sender != nextMessage.sender;
            }

            return Message(
                message: message, isMe: isMe, isShowAvatar: isShowAvatar);
          },
        ),
      ),
    );
  }
}
