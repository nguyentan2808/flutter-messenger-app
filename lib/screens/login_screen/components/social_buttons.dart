import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab6/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../components/error_notification.dart';
import '../../../constants/routes_constant.dart';
import '../../../constants/theme_constant.dart';
import '../../../controllers/auth_controller.dart';
import '../../../services/google_signin_service.dart';

class SocialButtons extends StatelessWidget {
  SocialButtons({Key? key}) : super(key: key);

  void _handleFacebookLogin() {}

  void _handleAppleLogin() {}

  showLoaderDialog(BuildContext context) {
    Widget alert = WillPopScope(
        child: AlertDialog(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.all(kDefaultPadding),
          content: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: SpinKitSpinningLines(
                  duration: const Duration(milliseconds: 2000),
                  color: Theme.of(context).primaryColor,
                  size: 36,
                ),
              ),
              const SizedBox(width: kDefaultPadding),
              const Text("Login..."),
            ],
          ),
        ),
        onWillPop: () async => false);

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => alert,
    );
  }

  @override
  Widget build(BuildContext context) {
    Future _handleGoogleLogin() async {
      // pushNotify(context, "Error", "Something went wrong. Please try again.");

      try {
        final idToken = await GoogleSignInService.getTokenId();

        if (idToken != null) {
          showLoaderDialog(context);

          await context.read<Auth>().googleLogin(idToken);
          Get.back();

          Get.offAllNamed(Routes.home);
          pushNotify(context, "Notification", "Login successfully.");
        }
      } catch (e) {
        Get.back();
        pushNotify(context, "Error", "Something went wrong. Please try again.");
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(100.0),
          child: SvgPicture.asset(
            'assets/images/google_svg.svg',
            height: 40,
          ),
          onTap: _handleGoogleLogin,
        ),
        const SizedBox(width: kDefaultPadding),
        InkWell(
          child: SvgPicture.asset(
            'assets/images/facebook_svg.svg',
            height: 40,
          ),
          borderRadius: BorderRadius.circular(100.0),
          onTap: _handleFacebookLogin,
        ),
        const SizedBox(width: kDefaultPadding),
        InkWell(
          child: SvgPicture.asset(
            'assets/images/apple_svg.svg',
            height: 40,
          ),
          borderRadius: BorderRadius.circular(100.0),
          onTap: _handleAppleLogin,
        ),
      ],
    );
  }
}
