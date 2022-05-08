import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab6/components/error_notification.dart';
import 'package:lab6/services/google_signin_service.dart';

import '../../constants/routes_constant.dart';
import '../../constants/theme_constant.dart';
import '../../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRemember = false;

  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildIllustration(),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.2),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "login_desc".tr,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      buildEmailTextField(context),
                      const SizedBox(height: kDefaultPadding),
                      buildPasswordTextField(context),
                      const SizedBox(height: kDefaultPadding),
                      buildRememberAndForgot(context),
                      const SizedBox(height: kDefaultPadding),
                      buildLoginButton(),
                      const SizedBox(height: kDefaultPadding),
                      buildDivider(),
                      const SizedBox(height: kDefaultPadding),
                      SocialButtons(),
                      const SizedBox(height: kDefaultPadding),
                      buildSignUpButton(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildSignUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.6,
            child: Text(
              "login_dont_have_account".tr,
              style: const TextStyle(
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.signUp),
            child: Text(
              'login_signup'.tr,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding * 0.5),
            child: Text(
              "login_or".tr,
              style: GoogleFonts.outfit(
                fontSize: 12,
                textStyle: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton buildLoginButton() {
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

  Row buildRememberAndForgot(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => setState(() => isRemember = !isRemember),
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Checkbox(
                    activeColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    value: isRemember,
                    onChanged: (value) => setState(() => isRemember = value!),
                  ),
                ),
                Text(
                  "login_remember".tr,
                ),
              ],
            )),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.forgotPassword),
          child: Text(
            "login_forgot".tr,
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  SizedBox buildIllustration() {
    return SizedBox(
      height: Get.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding * 1.5),
        child: SvgPicture.asset(
          'assets/images/login_svg.svg',
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  TextFormField buildEmailTextField(BuildContext context) {
    String? _validator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your phone number or email address';
      } else if (value.length < 6 || value.length > 15) {
        return 'This field must be between 6 and 15 characters';
      }
      return null;
    }

    return TextFormField(
      controller: _phoneController,
      validator: _validator,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Theme.of(context).primaryColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 16),
        hintText: "login_username".tr,
      ),
    );
  }

  TextFormField buildPasswordTextField(BuildContext context) {
    String? _validator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your password';
      } else if (value.length < 8) {
        return 'Password must be at least 8 characters';
      }
      return null;
    }

    return TextFormField(
      controller: _passwordController,
      validator: _validator,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.verified_user_rounded,
          color: Theme.of(context).primaryColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 16),
        hintText: "login_password".tr,
      ),
    );
  }
}

class SocialButtons extends StatelessWidget {
  SocialButtons({Key? key}) : super(key: key);
  final _authController = Get.find<AuthController>();

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
      try {
        final idToken = await GoogleSignInService.getTokenId();

        if (idToken != null) {
          showLoaderDialog(context);

          await _authController.loginBE(idToken);
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
