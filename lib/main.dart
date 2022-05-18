import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'constants/routes_constant.dart';
import 'providers/auth_provider.dart';
import 'screens/change_password/change_password_screen.dart';
import 'screens/chat_options/chat_options_screen.dart';
import 'screens/chat_detail/chat_detail_screen.dart';
import 'screens/edit_profile/edit_profile_screen.dart';
import 'screens/forgot_password/forgot_password.dart';
import 'screens/home/home_screen.dart';
import 'screens/login_screen/login_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/otp_form/otp_form_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/reset_password/reset_password_screen.dart';
import 'screens/setting/components/language_screen.dart';
import 'screens/setting/components/theme_mode_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash.dart';
import 'services/i18n_service.dart';
import 'services/theme_service.dart';
import 'theme.dart';

void main() async {
  await GetStorage.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Auth()),
    ],
    child: const MyApp(),
  ));
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
              page: () => const ForgotPasswordScreen(),
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
            GetPage(
              name: Routes.otpForm,
              page: () => OTPFormScreen(),
              transition: Transition.rightToLeftWithFade,
            ),
            GetPage(
              name: Routes.resetPassword,
              page: () => ResetPassword(),
              transition: Transition.rightToLeftWithFade,
            ),
          ],
        ),
      ),
    );
  }
}
// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// /// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

// void main() {
//   runApp(
//     /// Providers are above [MyApp] instead of inside it, so that tests
//     /// can use [MyApp] while mocking the providers
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => Counter()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// /// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// // ignore: prefer_mixin
// class Counter with ChangeNotifier, DiagnosticableTreeMixin {
//   int _count = 0;

//   int get count => _count;

//   void increment() {
//     _count++;
//     notifyListeners();
//   }

//   /// Makes `Counter` readable inside the devtools by listing all of its properties
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Count(
//               count: context.watch<Counter>().count,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         key: const Key('increment_floatingActionButton'),
//         onPressed: () => context.read<Counter>().increment(),
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class Count extends StatelessWidget {
//   const Count({Key? key, required this.count}) : super(key: key);

//   final int count;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           count.toString(),
//           key: const Key('counterState'),
//           style: Theme.of(context).textTheme.headline4,
//         ),
//         ElevatedButton(
//           onPressed: () => context.read<Counter>().increment(),
//           child: const Text('Increment'),
//         ),
//       ],
//     );
//   }
// }
