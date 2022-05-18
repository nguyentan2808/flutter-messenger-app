import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';

class TextGroup extends StatelessWidget {
  const TextGroup({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "otp_title".tr,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: kDefaultPadding / 2),
        Opacity(
          opacity: 0.8,
          child: Text(
            "otp_desc".tr,
          ),
        ),
        const SizedBox(height: kDefaultPadding / 2),
        Row(
          children: [
            Text(
              "$email ",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              "otp_change_username".tr,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
