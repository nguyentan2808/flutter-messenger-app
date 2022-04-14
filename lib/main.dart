// import 'package:flutter/material.dart';
// import 'package:lab6/screens/login_screen.dart';
// import 'package:lab6/theme.dart';

// void main() => runApp(
//       // DevicePreview(
//       //   enabled: !kReleaseMode,
//       //   builder: (context) =>
//       // ),
//       MaterialApp(
//         debugShowCheckedModeBanner: false,
//         useInheritedMediaQuery: true,
//         theme: ThemeData(
//           primarySwatch: Colors.indigo,
//         ),
//         darkTheme: darkThemeData(context)
//         // locale: DevicePreview.locale(context),
//         // builder: DevicePreview.appBuilder,
//         home: const LoginScreen(),
//       ),
//     );

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lab6/screens/login_screen.dart';
import 'package:lab6/services/theme_service.dart';
import 'package:lab6/theme.dart';

void main() async {
  await GetStorage.init(); // add this

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: true,
              themeMode: ThemeService().theme, // add this
              theme: lightThemeData(context),
              darkTheme: darkThemeData(context),
              title: 'Flutter Demo',
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              home: const LoginScreen(),
            ));
  }
}
