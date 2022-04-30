import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/item_model.dart';
import '../components/theme_mode_screen.dart';
import '../components/language_screen.dart';

List<ItemModel> listAppSettings = [
  ItemModel(
    icon: Icons.dark_mode,
    iconColor: Colors.black,
    title: 'Dark mode',
    subTitle: 'Turn off',
    isNavigation: true,
    handleClick: () {
      Get.to(
        () => const ThemeModeScreen(),
        transition: Transition.rightToLeft,
      );
    },
  ),
  ItemModel(
    icon: Icons.translate,
    iconColor: Colors.indigo,
    title: 'Languages',
    subTitle: 'Change app language',
    isNavigation: false,
    handleClick: () {
      Get.to(
        () => const LanguagesScreen(),
        transition: Transition.rightToLeft,
      );
    },
  ),
  ItemModel(
    icon: Icons.person,
    iconColor: Colors.cyan,
    title: 'Account',
    subTitle: 'Privacy, terms, security',
    isNavigation: false,
    handleClick: () {},
  ),
];

List<ItemModel> listPreferenceSettings = [
  ItemModel(
    icon: Icons.store,
    iconColor: Colors.cyan,
    title: 'Message request',
    subTitle: 'Accept or decline',
    isNavigation: false,
    handleClick: () {},
  ),
  ItemModel(
    icon: Icons.notifications,
    iconColor: Colors.amber,
    title: 'Notifications and sounds',
    subTitle: 'Sounds settings',
    isNavigation: false,
    handleClick: () {},
  ),
  ItemModel(
    icon: Icons.store,
    iconColor: Colors.purple,
    title: 'Archived chats',
    subTitle: 'Conversation have been archived',
    isNavigation: false,
    handleClick: () {},
  ),
  ItemModel(
    icon: Icons.privacy_tip,
    iconColor: Colors.deepPurpleAccent,
    title: 'Privacy',
    subTitle: 'Privacy policy',
    isNavigation: false,
    handleClick: () {},
  ),
];

List<ItemModel> listOthersSettings = [
  ItemModel(
    icon: Icons.help,
    iconColor: Colors.green,
    title: 'Help',
    subTitle: 'Help center',
    isNavigation: true,
    handleClick: () {},
  ),
  ItemModel(
    icon: Icons.warning,
    iconColor: Colors.deepOrange,
    title: 'Report',
    subTitle: 'Send us a report',
    isNavigation: false,
    handleClick: () {},
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
