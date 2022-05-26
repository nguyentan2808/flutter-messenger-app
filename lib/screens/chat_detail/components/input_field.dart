import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/api/index.dart';
import 'package:lab6/models/conversation_model.dart';
import 'package:lab6/models/message_model.dart';
import 'package:lab6/providers/auth_provider.dart';
import 'package:lab6/providers/messages_provider.dart';
import 'package:lab6/providers/socket_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/theme_constant.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.scrollController,
    required this.conversation,
    required this.receiver,
    required this.handleChangeConversation,
  }) : super(key: key);

  final ScrollController scrollController;
  final ConversationModel? conversation;
  final UserDetailModel? receiver;
  final void Function(ConversationModel) handleChangeConversation;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isTyping = false;
  String message = '';
  final FocusNode inputFocus = FocusNode();
  final TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputFocus.addListener(handleChangeFocus);
    inputController.addListener(handleChangeInput);
  }

  @override
  void dispose() {
    super.dispose();
    inputController.removeListener(handleChangeInput);
    inputFocus.removeListener(handleChangeFocus);
    inputController.dispose();
    inputFocus.dispose();
  }

  void handleChangeFocus() {
    setState(() {
      isTyping = inputFocus.hasFocus;
    });
  }

  void handleChangeInput() {
    setState(() {
      message = inputController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.1),
            ),
          ]),
      child: Row(
        children: [
          buildActions(),
          const SizedBox(width: kDefaultPadding * 0.8),
          buildInput(context)
        ],
      ),
    );
  }

  Widget buildActions() {
    if (isTyping) {
      return GestureDetector(
        onTap: inputFocus.unfocus,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 16,
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    } else {
      return Row(
        children: [
          Icon(
            Icons.mic,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: kDefaultPadding * (3 / 4)),
          Icon(
            Icons.image,
            color: Theme.of(context).primaryColor,
          ),
        ],
      );
    }
  }

  Expanded buildInput(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: inputFocus.unfocus,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(children: [
            Icon(
              Icons.sentiment_satisfied_alt_outlined,
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color
                  ?.withOpacity(0.5),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                focusNode: inputFocus,
                controller: inputController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding * (3 / 4)),
                    isDense: true,
                    hintStyle: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyText1!.fontSize),
                    hintText: 'chat_detail_type_message'.tr,
                    border: InputBorder.none),
              ),
            ),
            GestureDetector(
              onTap: () async {
                String value = inputController.text;
                String sender = context.read<Auth>().user!.username;
                MessageModel message = MessageModel("Oke", sender, value, true);
                inputController.text = "";

                if (widget.conversation == null) {
                  var response = await API().createConversation(
                    context.read<Auth>().user!.username,
                    widget.receiver!.username,
                  );

                  ConversationModel conversation =
                      ConversationModel.fromJson(response.data["conversation"]);

                  widget.handleChangeConversation(conversation);

                  context.read<MessageProvider>().newMessage(message);
                  context.read<SocketProvider>().socket.emit("new-message", {
                    "conversationId": conversation.id,
                    "content": value,
                    "sender": sender,
                    "receiver": conversation.users[0].username == sender
                        ? conversation.users[1].username
                        : conversation.users[0].username
                  });
                } else {
                  context.read<MessageProvider>().newMessage(message);
                  context.read<SocketProvider>().socket.emit("new-message", {
                    "conversationId": widget.conversation!.id,
                    "content": value,
                    "sender": sender,
                    "receiver": widget.conversation!.users[0].username == sender
                        ? widget.conversation!.users[1].username
                        : widget.conversation!.users[0].username
                  });
                }
              },
              child: Icon(
                Icons.send,
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color
                    ?.withOpacity(0.5),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
