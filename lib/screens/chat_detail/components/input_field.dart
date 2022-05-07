import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/controllers/messages_controller.dart';
import 'package:lab6/screens/chat_detail/models/message_model.dart';

import '../../../constants/theme_constant.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

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
              onTap: () {
                String value = inputController.text;
                Get.put(MessagesController()).messages.insert(
                      0,
                      MessageModel(
                        "1",
                        "2",
                        "nguyentan2808",
                        value,
                        "",
                        MessageType.text,
                        null,
                        false,
                        "15 THG 4 10:42",
                      ),
                    );
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
