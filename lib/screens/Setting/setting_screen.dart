import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/profile_preview.dart';
import 'components/setting_appbar.dart';
import 'components/setting_section.dart';
import 'data/settings_data.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfilePreview(),
            SettingSection(title: "setting_app".tr, list: listAppSettings),
            SettingSection(
                title: "setting_preference".tr, list: listPreferenceSettings),
            SettingSection(title: "setting_other".tr, list: listOthersSettings),
          ],
        ),
      ),
    );
  }
}
