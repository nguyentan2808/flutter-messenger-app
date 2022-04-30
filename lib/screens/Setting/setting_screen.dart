// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lab6/services/i18n_service.dart';
// import 'package:settings_ui/settings_ui.dart';

// import '../../services/theme_service.dart';

// class SettingScreen extends StatefulWidget {
//   const SettingScreen({Key? key}) : super(key: key);

//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingScreen> {
//   bool _isDarkMode = false;
//   bool _isVN = false;

//   @override
//   Widget build(BuildContext context) {
//     return SettingsList(
//       sections: [
//         SettingsSection(
//           title: const Text('Common'),
//           tiles: <SettingsTile>[
//             SettingsTile.switchTile(
//               onToggle: (value) {
//                 setState(() {
//                   _isDarkMode = value;
//                 });
//                 ThemeService().switchTheme();
//               },
//               initialValue: _isDarkMode,
//               leading: const Icon(Icons.format_paint),
//               title: const Text('Dark mode'),
//             ),
//             SettingsTile.switchTile(
//               onToggle: (value) {
//                 if (_isVN) {
//                   I18nService().changeLocale('en');
//                 } else {
//                   I18nService().changeLocale('vi');
//                 }
//                 setState(() {
//                   _isVN = !_isVN;
//                 });
//               },
//               initialValue: _isDarkMode,
//               leading: const Icon(Icons.language),
//               title: Text('hello'.tr),
//             ),
//           ],
//         ),
//       ],
//     );

//     //   return Scaffold(
//     //     appBar: AppBar(
//     //       backgroundColor: Colors.transparent,
//     //       automaticallyImplyLeading: false,
//     //       leading: const Icon(
//     //         Icons.arrow_back,
//     //         size: 30,
//     //       ),
//     //       iconTheme:
//     //           IconThemeData(color: Theme.of(context).textTheme.bodyText1?.color),
//     //       title: Text(
//     //         'Settings',
//     //         style: TextStyle(
//     //             color: Theme.of(context).textTheme.bodyText1?.color,
//     //             fontSize: 24.0),
//     //       ),
//     //     ),
//     //     body: Padding(
//     //       padding: const EdgeInsets.all(16.0),
//     //       child: Column(
//     //         children: [
//     //           Row(children: [
//     //             CircleAvatar(
//     //               radius: screenSize.width * 0.1,
//     //               backgroundImage: const AssetImage('assets/images/avatar.jpg'),
//     //             ),
//     //             const SizedBox(width: 16),
//     //             Expanded(
//     //               child: Column(
//     //                 crossAxisAlignment: CrossAxisAlignment.start,
//     //                 children: const [
//     //                   Text(
//     //                     'Madara Uchiha',
//     //                     style: TextStyle(
//     //                       fontFamily: "Outfit",
//     //                       fontSize: 24,
//     //                     ),
//     //                   ),
//     //                   SizedBox(height: 8.0),
//     //                   Text("Don't tell anyone, but I'm a ninja! "),
//     //                 ],
//     //               ),
//     //             ),
//     //             const SizedBox(width: 40.0),
//     //             const Icon(
//     //               Icons.qr_code_scanner,
//     //               size: 28.0,
//     //             )
//     //           ]),
//     //           const SizedBox(height: 40.0),
//     //           Expanded(child: ListView.builder(itemBuilder: (context, index) {
//     //             return Column(
//     //               children: [
//     //                 Row(children: [
//     //                   const Icon(
//     //                     Icons.person_outline,
//     //                     size: 40,
//     //                   ),
//     //                   const SizedBox(width: 16.0),
//     //                   Expanded(
//     //                       child: Column(
//     //                     crossAxisAlignment: CrossAxisAlignment.start,
//     //                     children: const [
//     //                       Text('Account',
//     //                           style: TextStyle(
//     //                               fontFamily: 'Outfit',
//     //                               fontSize: 22,
//     //                               fontWeight: FontWeight.w500),),
//     //                       Text(
//     //                         'Privacy, secutrity, change email or number',
//     //                         style: TextStyle(
//     //                           fontFamily: 'Outfit',
//     //                         ),
//     //                       )
//     //                     ],
//     //                   ),),
//     //                 ]),
//     //                 const SizedBox(
//     //                   height: 12,
//     //                 ),
//     //               ],
//     //             );
//     //           }),)
//     //         ],
//     //       ),
//     //     ),
//     //   );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constant.dart';
import 'package:lab6/screens/Setting/dark_mode.dart';

import 'language_screen.dart';

class ItemModel {
  IconData icon;
  Color iconColor;
  String title;
  String subTitle;
  bool isNavigation;
  VoidCallback handleClick;

  ItemModel(
      {required this.icon,
      required this.iconColor,
      required this.title,
      required this.subTitle,
      required this.isNavigation,
      required this.handleClick});
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<ItemModel> listAppSettings = [
    ItemModel(
      icon: Icons.dark_mode,
      iconColor: Colors.black,
      title: 'Dark mode',
      subTitle: 'Turn off',
      isNavigation: true,
      handleClick: () {
        Get.to(
          () => const DarkModeScreen(),
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AccountPreview(),
          SettingSection(title: "Apps", list: listAppSettings),
          SettingSection(title: "Preference", list: listPreferenceSettings),
          SettingSection(title: "Other", list: listOthersSettings),
        ],
      ),
    );
  }
}

class AccountPreview extends StatelessWidget {
  const AccountPreview({Key? key}) : super(key: key);
  final name = "Nguyễn Tân";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage('assets/images/avatar.jpg'),
                radius: Get.width * 1 / 8,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      size: 20,
                    ),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            name,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class SettingSection extends StatelessWidget {
  const SettingSection({Key? key, required this.title, required this.list})
      : super(key: key);
  final String title;
  final List<ItemModel> list;

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
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
          ),
          ...list.map((item) => SettingRow(item: item)).toList(),
        ],
      ),
    );
  }
}

class SettingRow extends StatelessWidget {
  const SettingRow({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -2),
      leading: Container(
        padding: const EdgeInsets.all(kDefaultPadding / 2 + 1),
        decoration: BoxDecoration(
            color: item.iconColor,
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Icon(
          item.icon,
          color: Colors.white,
          size: 22,
        ),
      ),
      trailing: const Icon(Icons.navigate_next),
      title: Text(item.title),
      subtitle: Text(
        item.subTitle,
        style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1?.color, fontSize: 12),
      ),
      onTap: item.handleClick,
    );
  }
}
