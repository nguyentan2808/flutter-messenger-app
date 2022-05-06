import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';

class RowOption extends StatelessWidget {
  const RowOption(
      {Key? key, required this.onTap, required this.icon, required this.text})
      : super(key: key);

  final Function() onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 2 / 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: Icon(icon,
                  size: 18,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? Colors.white.withOpacity(0.1)
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ],
        ),
      ),
    );
  }
}
