import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constant.dart';

import '../login_screen.dart';

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

    Future.delayed(
      const Duration(milliseconds: 1000),
      () => setState(() => isLoading = true),
    );

    Future.delayed(
      const Duration(milliseconds: 2000),
      () => Get.offAll(
        () => const LoginScreen(),
        transition: Transition.fadeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(isLoading.toString());
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
                    height: kDefaultPadding * 1,
                  ),
                  // SizedBox(
                  //   height: 30,
                  //   width: 30,
                  //   child: isLoading
                  //       ? const CircularProgressIndicator(
                  //           strokeWidth: 3,
                  //           color: Colors.blue,
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
