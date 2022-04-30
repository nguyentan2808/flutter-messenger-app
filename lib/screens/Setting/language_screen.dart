import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constant.dart';
import 'package:lab6/services/i18n_service.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  late String _language;

  @override
  void initState() {
    super.initState();

    _language = I18nService().locale == const Locale('vi', 'VN') ? 'vi' : 'en';
  }

  _handleChangeLanguage(String newValue) {
    if (newValue == "system") {
      I18nService().syncToSystem();
    } else {
      I18nService().changeLocale(newValue);
    }
    setState(() {
      _language = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("languages".tr),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Tiếng Việt'),
            trailing: Radio(
              value: 'vi',
              groupValue: _language,
              onChanged: (value) => _handleChangeLanguage('vi'),
            ),
            onTap: () => _handleChangeLanguage('vi'),
          ),
          ListTile(
            title: const Text('English - United States'),
            trailing: Radio(
              value: 'en',
              groupValue: _language,
              onChanged: (value) => _handleChangeLanguage('en'),
            ),
            onTap: () => _handleChangeLanguage('en'),
          ),
          ListTile(
            title: const Text('Hệ thống'),
            trailing: Radio(
              value: 'system',
              groupValue: _language,
              onChanged: (value) => _handleChangeLanguage('system'),
            ),
            onTap: () => _handleChangeLanguage('system'),
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
