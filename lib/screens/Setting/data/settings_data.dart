import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/routes_constant.dart';
import '../models/item_model.dart';

List<ItemModel> listAppSettings = [
  ItemModel(
    icon: Icons.dark_mode,
    iconColor: Colors.black,
    title: 'Dark mode',
    subTitle: 'Turn off',
    isNavigation: true,
    handleClick: () {
      Get.toNamed(Routes.themeSetting);
    },
  ),
  ItemModel(
    icon: Icons.translate,
    iconColor: Colors.indigo,
    title: 'Languages',
    subTitle: 'Change app language',
    isNavigation: false,
    handleClick: () {
      Get.toNamed(Routes.languageSetting);
    },
  ),
  ItemModel(
    icon: Icons.person,
    iconColor: Colors.green,
    title: 'Account',
    subTitle: 'User information settings',
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
    title: 'Message request',
    subTitle: 'Accept or decline',
    isNavigation: false,
  ),
  ItemModel(
    icon: Icons.notifications,
    iconColor: Colors.amber,
    title: 'Notifications and sounds',
    subTitle: 'Sounds settings',
    isNavigation: false,
  ),
  ItemModel(
    icon: Icons.store,
    iconColor: Colors.purple,
    title: 'Archived chats',
    subTitle: 'Conversation have been archived',
    isNavigation: false,
  ),
  ItemModel(
    icon: Icons.privacy_tip,
    iconColor: Colors.deepPurpleAccent,
    title: 'Privacy',
    subTitle: 'Privacy policy',
    isNavigation: false,
  ),
];

List<ItemModel> listOthersSettings = [
  ItemModel(
    icon: Icons.help,
    iconColor: Colors.green,
    title: 'Help',
    subTitle: 'Help center',
    isNavigation: true,
  ),
  ItemModel(
    icon: Icons.warning,
    iconColor: Colors.deepOrange,
    title: 'Report',
    subTitle: 'Send us a report',
    isNavigation: false,
  ),
  ItemModel(
    icon: Icons.password,
    iconColor: Colors.indigo,
    title: 'Change password',
    subTitle: 'Lorem ipsum dolor sit amet',
    isNavigation: false,
    handleClick: () {
      Get.toNamed(Routes.changePassword);
    },
  ),
  ItemModel(
    icon: Icons.exit_to_app,
    iconColor: Colors.grey,
    title: 'Logout',
    subTitle: 'Exit your account',
    isNavigation: false,
    handleClick: () {},
  ),
];
