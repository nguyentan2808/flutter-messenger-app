import 'package:flutter/material.dart';
import 'package:lab6/constant.dart';
import 'package:lab6/services/theme_service.dart';

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
        title: const Text("Dark mode"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Dark mode'),
            trailing: Radio(
              value: 'dark',
              groupValue: _mode,
              onChanged: (value) => handleChangeMode('dark'),
            ),
            onTap: () => handleChangeMode('dark'),
          ),
          ListTile(
            title: const Text('Light mode'),
            trailing: Radio(
              value: 'light',
              groupValue: _mode,
              onChanged: (value) => handleChangeMode('light'),
            ),
            onTap: () => handleChangeMode('light'),
          ),
          ListTile(
            title: const Text('System'),
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
              "If system is selected, the app will automatically adjust your appearance based on your device's system settings.",
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
