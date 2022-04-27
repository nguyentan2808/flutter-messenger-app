import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lab6/constant.dart';
import 'package:lab6/screens/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void _handleLogin() {
      Get.to(
        () => HomeScreen(),
        transition: Transition.cupertinoDialog,
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: size.height * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                child: SvgPicture.asset(
                  'assets/images/login_svg.svg',
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.2),
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
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      // fillColor: Colors.red,

                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5,
                          vertical: kDefaultPadding),
                      hintStyle: const TextStyle(fontSize: 16),
                      hintText: "Username or Phone Number",
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.verified_user_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5,
                          vertical: kDefaultPadding),
                      hintStyle: const TextStyle(fontSize: 16),
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    alignment: Alignment.topRight,
                    child: const Text(
                      "Forgot Password ?",
                      style: TextStyle(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(
                        Size(size.width * 0.9, 50),
                      ),
                    ),
                    onPressed: _handleLogin,
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                      // style: TextStyle(
                      //     color: Theme.of(context).textTheme.bodyText1?.color),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CustomDivider(),
                        Padding(
                          padding: EdgeInsets.all(kDefaultPadding * 0.5),
                          child: Text(
                            "Or sign in with",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        CustomDivider(),
                      ],
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  const SocialButtons(),
                  const SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
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
