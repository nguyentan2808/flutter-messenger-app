import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab6/components/loader_dialog.dart';
import 'package:lab6/components/notification.dart';
import 'package:lab6/services/auth_service.dart';

import '../../../constants/routes_constant.dart';

class InputGroup extends StatelessWidget {
  const InputGroup({
    Key? key,
    required this.formKey,
    required this.firstDigitController,
    required this.secondDigitController,
    required this.thirdDigitController,
    required this.fourthDigitController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController firstDigitController;
  final TextEditingController secondDigitController;
  final TextEditingController thirdDigitController;
  final TextEditingController fourthDigitController;

  @override
  Widget build(BuildContext context) {
    Future _handleSubmit(String value) async {
      FocusScope.of(context).unfocus();
      try {
        String first = firstDigitController.text;
        String second = secondDigitController.text;
        String third = thirdDigitController.text;

        if (first.isNotEmpty && second.isNotEmpty && third.isNotEmpty) {
          LoaderDialog.show(context, 'Verifying OTP...');
          int otp = int.parse('$first$second$third$value');
          String username = await AuthService().verifyOTP(context, otp);

          LoaderDialog.hide();

          Get.toNamed(Routes.resetPassword, arguments: username);
        }
      } catch (e) {
        LoaderDialog.hide();
        NotificationDialog.show(context, "Error", e.toString());
      }
    }

    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onTap: () {
                firstDigitController.text = "";
              },
              controller: firstDigitController,
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.grey.withOpacity(Get.isDarkMode ? 0.05 : 0.15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  secondDigitController.text = "";
                }
              },
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              controller: secondDigitController,
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.grey.withOpacity(Get.isDarkMode ? 0.05 : 0.15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  thirdDigitController.text = "";
                }
              },
              onTap: () {
                secondDigitController.text = "";
              },
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              controller: thirdDigitController,
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.grey.withOpacity(Get.isDarkMode ? 0.05 : 0.15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  fourthDigitController.text = "";
                }
              },
              onTap: () {
                thirdDigitController.text = "";
              },
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              controller: fourthDigitController,
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.grey.withOpacity(Get.isDarkMode ? 0.05 : 0.15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: _handleSubmit,
              onTap: () {
                fourthDigitController.text = "";
              },
            ),
          ),
        ],
      ),
    );
  }
}
