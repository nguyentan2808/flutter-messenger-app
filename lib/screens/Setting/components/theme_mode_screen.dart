import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';
import '../../../services/theme_service.dart';

class ThemeModeScreen extends StatefulWidget {
  const ThemeModeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeModeScreen> createState() => _ThemeModeScreenState();
}

class _ThemeModeScreenState extends State<ThemeModeScreen> {
  late String _mode;

  @override
  void initState() {
    super.initState();

    _mode = ThemeService().theme == ThemeMode.dark ? 'dark' : 'light';
  }

  handleChangeMode(String newValue) {
    if (newValue == 'system') {
      ThemeService().switchToSystem();
    } else if (newValue != _mode) {
      if (newValue == 'dark' && ThemeService().theme == ThemeMode.light) {
        ThemeService().switchTheme();
      } else if (newValue == 'light' &&
          ThemeService().theme == ThemeMode.dark) {
        ThemeService().switchTheme();
      }
    }
    setState(() {
      _mode = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dark_mode".tr),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("dark_mode".tr),
            trailing: Radio(
              value: 'dark',
              groupValue: _mode,
              onChanged: (value) => handleChangeMode('dark'),
            ),
            onTap: () => handleChangeMode('dark'),
          ),
          ListTile(
            title: Text("light_mode".tr),
            trailing: Radio(
              value: 'light',
              groupValue: _mode,
              onChanged: (value) => handleChangeMode('light'),
            ),
            onTap: () => handleChangeMode('light'),
          ),
          ListTile(
            title: Text("system_mode".tr),
            trailing: Radio(
              value: 'system',
              groupValue: _mode,
              onChanged: (value) => handleChangeMode('system'),
            ),
            onTap: () => handleChangeMode('system'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              "system_mode_desc".tr,
              style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.color
                      ?.withOpacity(0.6),
                  fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
