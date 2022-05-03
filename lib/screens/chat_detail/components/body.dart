import 'package:flutter/material.dart';
import 'input_field.dart';
import 'message_display.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          MessageDisplay(),
          InputField(),
        ],
      ),
    );
  }
}
