import 'package:flutter/material.dart';
import 'package:lab6/screens/login_screen.dart';

void main() => runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) =>
      // ),
      MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        theme: ThemeData(
            primarySwatch: Colors.indigo, primaryColor: Colors.indigo),
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        home: const LoginScreen(),
      ),
    );
