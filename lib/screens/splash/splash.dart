import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/theme_constant.dart';
import '../login_screen.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Widget initScreen;
    bool? isOnboardingDone = GetStorage().read("isOnboardingDone");

    if (isOnboardingDone == null || !isOnboardingDone) {
      initScreen = const OnboardingScreen();
    } else {
      initScreen = const LoginScreen();
    }

    Future.delayed(
      const Duration(milliseconds: 1000),
      () => setState(() => isLoading = true),
    );

    Future.delayed(
      const Duration(milliseconds: 2000),
      () => Get.offAll(
        () => initScreen,
        transition: Transition.fadeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/flutter_logo.png',
                    width: Get.width / 4,
                  ),
                  const SizedBox(
                    height: kDefaultPadding * 3,
                  ),
                  // SizedBox(
                  //   height: 3,
                  //   width: Get.width / 4,
                  //   child: isLoading
                  //       ? LinearProgressIndicator(
                  //           valueColor: const AlwaysStoppedAnimation<Color>(
                  //               Colors.blue),
                  //           backgroundColor: Colors.blue[200],
                  //           // valueColor: const AlwaysStoppedAnimation<Color>(
                  //           //     Colors.green),
                  //         )
                  //       : null,
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Column(
                children: [
                  Text(
                    "from",
                    style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.color
                          ?.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 4),
                  Image.asset(
                    'assets/images/meta_logo.png',
                    width: Get.width / 7,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
