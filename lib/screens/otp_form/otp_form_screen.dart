import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/theme_constant.dart';
import 'components/action_group.dart';
import 'components/count_down_resend.dart';
import 'components/input_group.dart';
import 'components/text_group.dart';

class OTPFormScreen extends StatelessWidget {
  OTPFormScreen({Key? key}) : super(key: key);

  final String email = Get.arguments;

  final _formKey = GlobalKey<FormState>();

  final _firstDigitController = TextEditingController();
  final _secondDigitController = TextEditingController();
  final _thirdDigitController = TextEditingController();
  final _fourthDigitController = TextEditingController();

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
          children: [
            TextGroup(email: email),
            const SizedBox(height: kDefaultPadding * 1.5),
            InputGroup(
              formKey: _formKey,
              firstDigitController: _firstDigitController,
              secondDigitController: _secondDigitController,
              thirdDigitController: _thirdDigitController,
              fourthDigitController: _fourthDigitController,
            ),
            const SizedBox(height: kDefaultPadding / 4),
            const CountDownResend(),
            const Spacer(),
            const ActionGroup()
          ],
        ),
      ),
    );
  }
}
