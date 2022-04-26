import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lab6/screens/login_screen.dart';
import 'package:lab6/services/theme_service.dart';
import 'package:lab6/theme.dart';

import 'services/i18n_service.dart';

void main() async {
  await GetStorage.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: false,
      builder: (context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        themeMode: ThemeService().theme,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        title: 'Telegram',
        builder: DevicePreview.appBuilder,
        home: const LoginScreen(),
        translations: I18nService(),
        locale: I18nService().locale,
        fallbackLocale: I18nService.fallbackLocale,
      ),
    );
  }
}
