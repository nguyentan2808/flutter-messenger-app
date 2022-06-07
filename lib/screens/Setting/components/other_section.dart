import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../components/notification.dart';
import '../../../components/loader_dialog.dart';
import '../../../constants/routes_constant.dart';
import '../../../constants/theme_constant.dart';
import '../../../providers/auth_provider.dart';
import '../../../services/auth_service.dart';
import '../models/item_model.dart';
import 'setting_row.dart';

class OtherSection extends StatelessWidget {
  const OtherSection({Key? key}) : super(key: key);

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
              "setting_other".tr,
              style: const TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ),
          SettingRow(
            item: ItemModel(
              icon: Icons.help,
              iconColor: Colors.green,
              title: "setting_help",
              subTitle: "setting_help_desc",
              isNavigation: true,
            ),
          ),
          SettingRow(
            item: ItemModel(
              icon: Icons.warning,
              iconColor: Colors.deepOrange,
              title: "setting_report",
              subTitle: "setting_report_desc",
              isNavigation: false,
            ),
          ),
          SettingRow(
            item: ItemModel(
              icon: Icons.password,
              iconColor: Colors.indigo,
              title: "setting_change_password",
              subTitle: "setting_change_password_desc",
              isNavigation: false,
              handleClick: context.watch<Auth>().user!.isLocal
                  ? () => Get.toNamed(Routes.changePassword)
                  : null,
            ),
          ),
          SettingRow(
            item: ItemModel(
              icon: Icons.exit_to_app,
              iconColor: Colors.grey,
              title: "setting_logout",
              subTitle: "setting_logout_desc",
              isNavigation: false,
              handleClick: () async {
                LoaderDialog.show(context, "Logout...");

                await AuthService().logOut(context);
                LoaderDialog.hide();
                NotificationDialog.show(
                    context, "Logout", "Logout successfully");

                Get.offAllNamed(Routes.login);
              },
            ),
          ),
        ],
      ),
    );
  }
}
