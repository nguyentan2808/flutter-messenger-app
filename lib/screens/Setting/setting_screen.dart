import 'package:flutter/material.dart';
import 'package:lab6/screens/setting/components/other_section.dart';
import 'package:lab6/screens/setting/components/preference_section.dart';

import 'components/app_section.dart';
import 'components/profile_preview.dart';
import 'components/setting_appbar.dart';

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
          children: const [
            ProfilePreview(),
            AppSection(),
            PreferenceSection(),
            OtherSection()
          ],
        ),
      ),
    );
  }
}
