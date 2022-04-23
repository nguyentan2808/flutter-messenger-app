import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isTyping = false;
  String message = '';
  final FocusNode inputMessageFocus = FocusNode();
  final TextEditingController inputMessageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputMessageFocus.addListener(handleChangeFocus);
    inputMessageController.addListener(handleChangeInputMessage);
  }

  @override
  void dispose() {
    super.dispose();
    inputMessageController.removeListener(handleChangeInputMessage);
    inputMessageFocus.removeListener(handleChangeFocus);
    inputMessageController.dispose();
    inputMessageFocus.dispose();
  }

  void handleChangeFocus() {
    setState(() {
      isTyping = inputMessageFocus.hasFocus;
    });
  }

  void handleChangeInputMessage() {
    setState(() {
      message = inputMessageController.text;
    });
  }

  void loseFocus() {
    inputMessageFocus.unfocus();
    setState(() {
      isTyping = false;
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
      child: SafeArea(
        child: Row(children: [
          isTyping
              ? IconButton(
                  onPressed: loseFocus,
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                  ),
                  color: Theme.of(context).primaryColor,
                )
              : Row(
                  children: [
                    Icon(
                      Icons.mic,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.image,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: loseFocus,
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
                      focusNode: inputMessageFocus,
                      controller: inputMessageController,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12.0),
                          isDense: true,
                          hintStyle: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .fontSize),
                          hintText: 'Type your message',
                          border: InputBorder.none),
                    ),
                  ),
                  Icon(
                    Icons.send,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color
                        ?.withOpacity(0.5),
                  ),
                ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
