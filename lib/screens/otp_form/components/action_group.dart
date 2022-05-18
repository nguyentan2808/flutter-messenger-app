import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';

class ActionGroup extends StatelessWidget {
  const ActionGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.8),
            onPressed: () {},
            child: Text(
              "otp_resend".tr,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: kDefaultPadding),
        Expanded(
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.8),
            color: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Text(
              "otp_confirm".tr,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
