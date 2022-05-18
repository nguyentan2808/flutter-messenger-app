import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/theme_constant.dart';
import 'components/action_group.dart';
import 'components/count_down_resend.dart';
import 'components/input_group.dart';
import 'components/text_group.dart';

class OTPFormScreen extends StatelessWidget {
  const OTPFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('otp_app_bar'.tr),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).textTheme.bodyText1?.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: const [
            TextGroup(),
            SizedBox(height: kDefaultPadding * 1.5),
            InputGroup(),
            SizedBox(height: kDefaultPadding / 4),
            CountDownResend(),
            Spacer(),
            ActionGroup()
          ],
        ),
      ),
    );
  }
}
