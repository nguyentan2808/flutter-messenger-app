import 'package:flutter/material.dart';

import 'components/app_bar.dart';
import 'components/body.dart';

class ChatDetailScreen extends StatefulWidget {
  ChatDetailScreen({Key? key}) : super(key: key);

  final List themeList = [
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.amber,
    Colors.deepOrange,
  ];

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  int themeIndex = 0;

  void handleChangeTheme() {
    setState(() {
      if (themeIndex == widget.themeList.length - 1) {
        themeIndex = 0;
        return;
      }
      themeIndex = themeIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: widget.themeList[themeIndex],
        colorScheme: ColorScheme.light(
            primary: widget.themeList[themeIndex],
            secondary: widget.themeList[themeIndex]),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: ChatDetailAppBar(
            handleChangeTheme: handleChangeTheme,
          ),
          body: const Body(),
        ),
      ),
    );
  }
}
