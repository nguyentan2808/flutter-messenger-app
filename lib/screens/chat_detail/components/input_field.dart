import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../api/index.dart';
import '../../../components/loader_dialog.dart';
import '../../../components/notification.dart';
import '../../../constants/theme_constant.dart';
import '../../../models/conversation_model.dart';
import '../../../models/message_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/messages_provider.dart';
import '../../../providers/socket_provider.dart';
import '../../../services/upload_image_service.dart';

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
          Actions(
            isTyping: isTyping,
            inputFocus: inputFocus,
            conversation: widget.conversation,
          ),
          const SizedBox(width: kDefaultPadding * 0.8),
          Input(
            conversation: widget.conversation,
            inputFocus: inputFocus,
            inputController: inputController,
            receiver: widget.receiver,
            handleChangeConversation: widget.handleChangeConversation,
          ),
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions(
      {Key? key,
      required this.isTyping,
      required this.inputFocus,
      required this.conversation})
      : super(key: key);

  final bool isTyping;
  final FocusNode inputFocus;
  final ConversationModel? conversation;

  @override
  Widget build(BuildContext context) {
    Future handleSendImage(String url) async {
      try {
        LoaderDialog.hide();
        String sender = context.read<Auth>().user!.username;
        String id = DateTime.now().microsecondsSinceEpoch.toString();

        MessageModel message = MessageModel(
          id,
          conversation!.id,
          sender,
          url,
          false,
          "",
          DateTime.now().toString(),
        );

        context.read<MessageProvider>().newMessage(message);
        context.read<SocketProvider>().socket.emit(
          "new-message",
          {
            "id": id,
            "conversationId": conversation!.id,
            "content": url,
            "sender": sender,
            "isText": false,
            "receiver": conversation!.users[0].username == sender
                ? conversation!.users[1].username
                : conversation!.users[0].username,
            "createdAt": DateTime.now().toString(),
          },
        );
      } catch (error) {
        LoaderDialog.hide();

        NotificationDialog.show(context, "Error", error.toString());
      }
    }

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
          GestureDetector(
            onTap: () {
              if (conversation != null) {
                UploadImageService().openPickerImage(context, handleSendImage);
              }
            },
            child: Icon(
              Icons.image,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      );
    }
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.inputFocus,
    required this.inputController,
    required this.conversation,
    required this.receiver,
    required this.handleChangeConversation,
  }) : super(key: key);

  final FocusNode inputFocus;
  final TextEditingController inputController;
  final ConversationModel? conversation;
  final UserDetailModel? receiver;
  final void Function(ConversationModel) handleChangeConversation;

  @override
  Widget build(BuildContext context) {
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
                if (inputController.text.isNotEmpty) {
                  String id = DateTime.now().microsecondsSinceEpoch.toString();
                  String value = inputController.text;
                  String sender = context.read<Auth>().user!.username;
                  MessageModel message = MessageModel(
                    id,
                    "",
                    sender,
                    value,
                    true,
                    "",
                    DateTime.now().toString(),
                  );
                  inputController.text = "";

                  if (conversation == null) {
                    var response = await API().createConversation(
                      [context.read<Auth>().user!.username, receiver!.username],
                    );

                    ConversationModel conversation = ConversationModel.fromJson(
                        response.data["conversation"]);

                    handleChangeConversation(conversation);

                    context.read<MessageProvider>().newMessage(message);
                    context.read<SocketProvider>().socket.emit("new-message", {
                      "id": id,
                      "conversationId": conversation.id,
                      "content": value,
                      "sender": sender,
                      "receiver": conversation.users[0].username == sender
                          ? conversation.users[1].username
                          : conversation.users[0].username,
                      "isText": true,
                      "createdAt": DateTime.now().toString(),
                    });
                  } else {
                    context.read<MessageProvider>().newMessage(message);
                    context.read<SocketProvider>().socket.emit("new-message", {
                      "id": id,
                      "conversationId": conversation!.id,
                      "content": value,
                      "sender": sender,
                      "receiver": conversation!.users[0].username == sender
                          ? conversation!.users[1].username
                          : conversation!.users[0].username,
                      "isText": true,
                      "createdAt": DateTime.now().toString(),
                    });
                  }
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
