import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../langs/vi.dart';
import '../langs/en.dart';

class I18nService extends Translations {
  static final _storage = GetStorage();
  static const fallbackLocale = Locale('en', 'US');
  static final Map<String, Locale> locales = {
    'vi': const Locale('vi', 'VN'),
    'en': const Locale('en', 'US'),
  };

  Locale get locale => _loadFromStorage();

  Locale _loadFromStorage() {
    String? value = _storage.read('lang');

    value ??= Get.deviceLocale?.languageCode;

    return locales[value] ?? fallbackLocale;
  }

  void _saveToStorage(String lang) {
    debugPrint("Saved: lang: $lang");
    _storage.write('lang', lang);
  }

  void changeLocale(String lang) {
    final locale = locales[lang] ?? fallbackLocale;

    Get.updateLocale(locale);
    _saveToStorage(lang);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'vi_VN': vi,
        'en_US': en,
      };
}
