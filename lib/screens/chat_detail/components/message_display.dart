import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../api/index.dart';
import '../../../components/notification.dart';
import '../../../constants/theme_constant.dart';
import '../../../models/conversation_model.dart';
import '../../../models/message_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/messages_provider.dart';
import 'message.dart';

class MessageDisplay extends StatefulWidget {
  const MessageDisplay({Key? key, required this.conversation})
      : super(key: key);

  final ConversationModel? conversation;

  @override
  State<MessageDisplay> createState() => _MessageDisplayState();
}

class _MessageDisplayState extends State<MessageDisplay> {
  bool isLoading = false;

  Future fetchMessages(ConversationModel? conversation) async {
    try {
      setState(() => isLoading = true);
      var response = await API().fetchAllMessage(conversation!.id);
      var messagesJson = response.data['messages'];
      List<MessageModel> messages = [];
      for (int i = 0; i < messagesJson.length; i++) {
        messages.add(MessageModel.fromJson(messagesJson[i]));
      }
      context.read<MessageProvider>().setMessages(messages);
      setState(() => isLoading = false);
    } catch (e) {
      NotificationDialog.show(context, "Error", "Failed to fetch messages");
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.conversation != null) {
      fetchMessages(widget.conversation);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<MessageModel> messages =
        context.watch<MessageProvider>().messages.reversed.toList();

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : messages.isEmpty
                    ? const Center(child: Text("No messages"))
                    : ListView.builder(
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final MessageModel message = messages[index];
                          final bool isMe = message.sender ==
                              context.watch<Auth>().user!.username;
                          bool isShowAvatar;

                          if (index == 0) {
                            isShowAvatar = true;
                          } else {
                            final MessageModel nextMessage =
                                messages[index - 1];
                            isShowAvatar = message.sender != nextMessage.sender;
                          }

                          return Message(
                            message: message,
                            isMe: isMe,
                            isShowAvatar: isShowAvatar,
                            conversation: widget.conversation,
                          );
                        },
                      ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
        ],
      ),
    );
  }
}
