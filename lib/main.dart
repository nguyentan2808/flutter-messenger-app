import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/login_binding.dart';
import 'constants/routes_constant.dart';
import 'screens/change_password/change_password.dart';
import 'screens/chat_detail/chat_detail_screen.dart';
import 'screens/chat_detail/components/options_screen.dart';
import 'screens/edit_profile/edit_profile_screen.dart';
import 'screens/forgot_password/forgot_password.dart';
import 'screens/home/home_screen.dart';
import 'screens/login_screen/login_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/setting/components/language_screen.dart';
import 'screens/setting/components/theme_mode_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash.dart';
import 'services/i18n_service.dart';
import 'services/theme_service.dart';
import 'theme.dart';

void main() async {
  await GetStorage.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void _handleFocus(BuildContext context) {
    FocusScopeNode focus = FocusScope.of(context);
    if (!focus.hasPrimaryFocus && focus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: false,
      builder: (context) => GestureDetector(
        onTap: () => _handleFocus(context),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          themeMode: ThemeService().theme,
          theme: lightThemeData(context),
          darkTheme: darkThemeData(context),
          title: 'Telegram',
          builder: DevicePreview.appBuilder,
          home: const SplashScreen(),
          translations: I18nService(),
          locale: I18nService().locale,
          fallbackLocale: I18nService.fallbackLocale,
          getPages: [
            GetPage(
              name: Routes.onboarding,
              page: () => const OnboardingScreen(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: Routes.login,
              page: () => const LoginScreen(),
              binding: LoginBinding(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: Routes.signUp,
              page: () => const SignUpScreen(),
              transition: Transition.rightToLeftWithFade,
            ),
            GetPage(
              name: Routes.home,
              page: () => HomeScreen(),
              transition: Transition.cupertinoDialog,
            ),
            GetPage(
              name: Routes.forgotPassword,
              page: () => ForgotPasswordScreen(),
              transition: Transition.rightToLeftWithFade,
            ),
            GetPage(
              name: Routes.changePassword,
              page: () => const ChangePasswordScreen(),
              transition: Transition.rightToLeftWithFade,
            ),
            GetPage(
              name: Routes.chatDetail,
              page: () => const ChatDetailScreen(),
              transition: Transition.cupertinoDialog,
            ),
            GetPage(
              name: Routes.chatOptions,
              page: () => ChatOptionsScreen(),
              transition: Transition.rightToLeftWithFade,
              transitionDuration: const Duration(microseconds: 100),
            ),
            GetPage(
              name: Routes.profile,
              page: () => const ProfileScreen(),
              transition: Transition.rightToLeftWithFade,
            ),
            GetPage(
              name: Routes.editProfile,
              page: () => EditProfileScreen(),
              transition: Transition.cupertinoDialog,
            ),
            GetPage(
              name: Routes.themeSetting,
              page: () => const ThemeModeScreen(),
              transition: Transition.rightToLeftWithFade,
            ),
            GetPage(
              name: Routes.languageSetting,
              page: () => const LanguagesScreen(),
              transition: Transition.rightToLeftWithFade,
            ),
          ],
        ),
      ),
    );
  }
}
