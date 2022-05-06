import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';

class CircleOption extends StatelessWidget {
  const CircleOption({Key? key, required this.icon, required this.text})
      : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: Icon(icon,
              size: 20, color: Get.isDarkMode ? Colors.white : Colors.black),
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? Colors.white.withOpacity(0.1)
                : Colors.grey[100],
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        const SizedBox(height: kDefaultPadding / 2),
        Text(text, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
