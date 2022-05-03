import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../constant.dart';
import '../login_screen.dart';
import 'data/pages_view.dart';
import 'models/page_view_model.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages.map((page) => buildPageView(page)).toList(),
      onDone: () {
        GetStorage().write("isOnboardingDone", true);
        Get.offAll(() => const LoginScreen(),
            transition: Transition.rightToLeftWithFade);
      },
      showBackButton: true,
      back: const Icon(Icons.arrow_back_sharp),
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward_outlined),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }

  PageViewModel buildPageView(OnboardingPageView page) {
    return PageViewModel(
      title: "",
      bodyWidget: SizedBox(
        height: Get.height * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 6,
              child: SvgPicture.asset(
                page.image,
                height: Get.height * 0.4,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    page.title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  SizedBox(
                    width: Get.width * 0.8,
                    child: Text(
                      page.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
