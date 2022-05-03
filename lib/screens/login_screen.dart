import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab6/screens/forgot_password/forgot_password.dart';

import '../constant.dart';
import 'home/home_screen.dart';
import 'sign_up/sign_up_screen.dart';

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
    final size = MediaQuery.of(context).size;

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
                      const Text(
                        "Login Details",
                        style: TextStyle(
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
                      const SocialButtons(),
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
          const Opacity(
            opacity: 0.6,
            child: Text(
              "Don't have account?",
              style: TextStyle(
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(
              () => const SignUpScreen(),
              transition: Transition.downToUp,
            ),
            child: Text(
              ' Sign Up',
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
              "Or sign in with",
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
      if (_formKey.currentState!.validate()) {
        Get.snackbar(
          "Login",
          "Login successfully to ${_phoneController.text}",
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: kDefaultRadius / 2,
        );
        Get.to(
          () => HomeScreen(),
          transition: Transition.cupertinoDialog,
        );
      }
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
      child: const Text(
        "Login",
        style: TextStyle(color: Colors.white),
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
                const Text(
                  "Remember Me",
                ),
              ],
            )),
        GestureDetector(
          onTap: () => Get.to(
            () => ForgotPasswordScreen(),
            transition: Transition.downToUp,
          ),
          child: const Text(
            "Forgot Password?",
            style: TextStyle(decoration: TextDecoration.underline),
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
        hintText: "Username or Phone Number",
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
        hintText: "Password",
      ),
    );
  }
}

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  final double spacing = 14.0;

  void _handleGoogleLogin() {}

  void _handleFacebookLogin() {}

  void _handleAppleLogin() {}

  @override
  Widget build(BuildContext context) {
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
        SizedBox(width: spacing),
        InkWell(
          child: SvgPicture.asset(
            'assets/images/facebook_svg.svg',
            height: 40,
          ),
          borderRadius: BorderRadius.circular(100.0),
          onTap: _handleFacebookLogin,
        ),
        SizedBox(width: spacing),
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
