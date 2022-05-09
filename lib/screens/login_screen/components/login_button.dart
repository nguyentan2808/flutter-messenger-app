import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/routes_constant.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleClick() {
      // if (_formKey.currentState!.validate()) {
      //   _authController.login();

      //   Get.snackbar(
      //     "Login",
      //     "Login successfully to ${_phoneController.text}",
      //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //     borderRadius: kDefaultRadius / 2,
      //   );
      //   Get.toNamed(Routes.home);
      // }

      // _authController.login();
      Get.toNamed(Routes.home);
    }

    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(Get.width * 0.9, 50),
        ),
      ),
      onPressed: _handleClick,
      child: Text(
        "login_login".tr,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
