import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constants/theme_constant.dart';

import '../../../components/filled_outline_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      color: Get.isDarkMode
          ? Theme.of(context).scaffoldBackgroundColor
          : Theme.of(context).primaryColor,
      child: Row(children: [
        FillOutlineButton(press: () {}, text: "Recent Message"),
        const SizedBox(width: 8),
        FillOutlineButton(
          press: () {},
          text: "Active",
          isFilled: false,
        )
      ]),
    );
  }
}
