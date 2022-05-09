import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/theme_constant.dart';

class NotificationDialog {
  static void show(BuildContext context, String title, String body) {
    Get.snackbar(
      title,
      body,
      borderWidth: 2,
      borderRadius: kDefaultRadius / 2,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(kDefaultPadding / 2),
      animationDuration: const Duration(milliseconds: 500),
      mainButton: TextButton(
        onPressed: () => Get.back(),
        child: const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    );
  }
}
