import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/routes_constant.dart';
import '../../../constants/theme_constant.dart';
import '../models/item_model.dart';
import 'setting_row.dart';

class AppSection extends StatelessWidget {
  const AppSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              "setting_app".tr,
              style: const TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ),
          SettingRow(
            item: ItemModel(
              icon: Icons.dark_mode,
              iconColor: Colors.black,
              title: 'setting_dark_mode',
              subTitle: "setting_dark_mode_desc",
              isNavigation: true,
              handleClick: () {
                Get.toNamed(Routes.themeSetting);
              },
            ),
          ),
          SettingRow(
            item: ItemModel(
              icon: Icons.translate,
              iconColor: Colors.indigo,
              title: "languages",
              subTitle: "setting_language_desc",
              isNavigation: false,
              handleClick: () {
                Get.toNamed(Routes.languageSetting);
              },
            ),
          ),
          SettingRow(
            item: ItemModel(
              icon: Icons.person,
              iconColor: Colors.green,
              title: "setting_account",
              subTitle: "setting_account_desc",
              isNavigation: false,
              handleClick: () {
                Get.toNamed(Routes.profile);
              },
            ),
          ),
        ],
      ),
    );
  }
}
