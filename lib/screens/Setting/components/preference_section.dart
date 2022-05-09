import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';
import '../models/item_model.dart';
import 'setting_row.dart';

class PreferenceSection extends StatelessWidget {
  const PreferenceSection({
    Key? key,
  }) : super(key: key);

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
              "setting_preference".tr,
              style: const TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ),
          SettingRow(
            item: ItemModel(
              icon: Icons.store,
              iconColor: Colors.cyan,
              title: "setting_message_request",
              subTitle: "setting_message_request_desc",
              isNavigation: false,
            ),
          ),
          SettingRow(
            item: ItemModel(
              icon: Icons.notifications,
              iconColor: Colors.amber,
              title: "setting_notification",
              subTitle: "setting_notification_desc",
              isNavigation: false,
            ),
          ),
          SettingRow(
            item: ItemModel(
              icon: Icons.store,
              iconColor: Colors.purple,
              title: "setting_archive",
              subTitle: "setting_archive_desc",
              isNavigation: false,
            ),
          ),
          SettingRow(
            item: ItemModel(
              icon: Icons.privacy_tip,
              iconColor: Colors.deepPurpleAccent,
              title: "setting_privacy",
              subTitle: "setting_privacy_desc",
              isNavigation: false,
            ),
          ),
        ],
      ),
    );
  }
}
