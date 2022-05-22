import 'package:flutter/material.dart';
import 'package:lab6/models/message_model.dart';
import 'package:lab6/providers/auth_provider.dart';
import 'package:lab6/providers/messages_provider.dart';
import 'package:provider/provider.dart';
import 'message.dart';

class MessageDisplay extends StatefulWidget {
  const MessageDisplay({Key? key}) : super(key: key);

  @override
  State<MessageDisplay> createState() => _MessageDisplayState();
}

class _MessageDisplayState extends State<MessageDisplay> {
  @override
  Widget build(BuildContext context) {
    List<MessageModel> messages = context.watch<MessageProvider>().messages;

    return Expanded(
      child: ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final MessageModel message = messages[index];
          final bool isMe =
              message.sender == context.watch<Auth>().user!.username;
          bool isShowAvatar;

          if (index == 0) {
            isShowAvatar = true;
          } else {
            final MessageModel nextMessage = messages[index - 1];
            isShowAvatar = message.sender != nextMessage.sender;
          }

          return Message(
              message: message, isMe: isMe, isShowAvatar: isShowAvatar);
        },
      ),
    );
  }
}
