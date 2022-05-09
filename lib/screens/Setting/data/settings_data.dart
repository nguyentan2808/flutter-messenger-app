import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lab6/controllers/auth_controller.dart';
import 'package:lab6/services/google_signin_service.dart';
import '../../../constants/routes_constant.dart';
import '../../../models/user_model.dart';
import '../models/item_model.dart';

List<ItemModel> listAppSettings = [
  ItemModel(
    icon: Icons.dark_mode,
    iconColor: Colors.black,
    title: 'setting_dark_mode',
    subTitle: "setting_dark_mode_desc",
    isNavigation: true,
    handleClick: () {
      Get.toNamed(Routes.themeSetting);
    },
  ),
  ItemModel(
    icon: Icons.translate,
    iconColor: Colors.indigo,
    title: "languages",
    subTitle: "setting_language_desc",
    isNavigation: false,
    handleClick: () {
      Get.toNamed(Routes.languageSetting);
    },
  ),
  ItemModel(
    icon: Icons.person,
    iconColor: Colors.green,
    title: "setting_account",
    subTitle: "setting_account_desc",
    isNavigation: false,
    handleClick: () {
      Get.toNamed(Routes.profile);
    },
  ),
];

List<ItemModel> listPreferenceSettings = [
  ItemModel(
    icon: Icons.store,
    iconColor: Colors.cyan,
    title: "setting_message_request",
    subTitle: "setting_message_request_desc",
    isNavigation: false,
  ),
  ItemModel(
    icon: Icons.notifications,
    iconColor: Colors.amber,
    title: "setting_notification",
    subTitle: "setting_notification_desc",
    isNavigation: false,
  ),
  ItemModel(
    icon: Icons.store,
    iconColor: Colors.purple,
    title: "setting_archive",
    subTitle: "setting_archive_desc",
    isNavigation: false,
  ),
  ItemModel(
    icon: Icons.privacy_tip,
    iconColor: Colors.deepPurpleAccent,
    title: "setting_privacy",
    subTitle: "setting_privacy_desc",
    isNavigation: false,
  ),
];

List<ItemModel> listOthersSettings = [
  ItemModel(
    icon: Icons.help,
    iconColor: Colors.green,
    title: "setting_help",
    subTitle: "setting_help_desc",
    isNavigation: true,
  ),
  ItemModel(
    icon: Icons.warning,
    iconColor: Colors.deepOrange,
    title: "setting_report",
    subTitle: "setting_report_desc",
    isNavigation: false,
  ),
  ItemModel(
    icon: Icons.password,
    iconColor: Colors.indigo,
    title: "setting_change_password",
    subTitle: "setting_change_password_desc",
    isNavigation: false,
    handleClick: () {
      Get.toNamed(Routes.changePassword);
    },
  ),
  ItemModel(
    icon: Icons.exit_to_app,
    iconColor: Colors.grey,
    title: "setting_logout",
    subTitle: "setting_logout_desc",
    isNavigation: false,
    handleClick: () {
      GetStorage().remove("user");
      Get.offAllNamed(Routes.login);

      GoogleSignInService.signOut();
    },
  ),
];
