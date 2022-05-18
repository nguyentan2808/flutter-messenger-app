import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../constants/routes_constant.dart';
import '../../constants/theme_constant.dart';
import '../../helpers/jwt_helper.dart';
import '../../models/user_model.dart';
import '../../providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;

  // void loadUserFromStorage() {
  //   var jsonUser = GetStorage().read("user");
  //   if (jsonUser != null) {
  //     UserModel user = UserModel.fromJson(jsonUser);

  //     context.read<Auth>().setUser(user);
  //   }
  // }

  Future navigateToHome() async {
    String initScreen;
    GetStorage localStorage = GetStorage();
    bool? isOnboardingDone = localStorage.read("isOnboardingDone");
    String? token = localStorage.read("token");

    if (isOnboardingDone == null || !isOnboardingDone) {
      initScreen = Routes.onboarding;
    } else if (token != null && token.isNotEmpty) {
      String userString = JWTHelper.decode(token);
      UserModel user = UserModel.fromJson(jsonDecode(userString));
      context.read<Auth>().setUser(user);

      initScreen = Routes.home;
    } else {
      initScreen = Routes.login;
    }

    Future.delayed(
      const Duration(milliseconds: 1000),
      () => setState(() => isLoading = true),
    );

    Future.delayed(
      const Duration(milliseconds: 2000),
      () => Get.offAllNamed(initScreen),
    );
  }

  @override
  void initState() {
    super.initState();

    // loadUserFromStorage();
    navigateToHome();
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
