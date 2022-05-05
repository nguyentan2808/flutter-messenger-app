import 'package:flutter/material.dart';

import 'components/app_bar.dart';
import 'components/input_field.dart';
import 'components/message_display.dart';
import 'data/theme_color_list_data.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  String theme = "indigo";

  void handleChangeTheme(String newValue) {
    setState(() => theme = newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: listThemeColor[theme],
        colorScheme: ColorScheme.light(
          primary: listThemeColor[theme] as Color,
          secondary: listThemeColor[theme] as Color,
        ),
      ),
      child: Scaffold(
        appBar: ChatDetailAppBar(handleChangeTheme: handleChangeTheme),
        body: Column(
          children: const [
            MessageDisplay(),
            InputField(),
          ],
        ),
      ),
    );
  }
}
