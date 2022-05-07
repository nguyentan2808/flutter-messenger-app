import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';
import '../../../services/i18n_service.dart';

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

    // Get.offAllNamed(Routes.splash);
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
            title: Text("vi".tr),
            trailing: Radio(
              value: 'vi',
              groupValue: _language,
              onChanged: (value) => _handleChangeLanguage('vi'),
            ),
            onTap: () => _handleChangeLanguage('vi'),
          ),
          ListTile(
            title: Text("en".tr),
            trailing: Radio(
              value: 'en',
              groupValue: _language,
              onChanged: (value) => _handleChangeLanguage('en'),
            ),
            onTap: () => _handleChangeLanguage('en'),
          ),
          ListTile(
            title: Text("system_mode".tr),
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
