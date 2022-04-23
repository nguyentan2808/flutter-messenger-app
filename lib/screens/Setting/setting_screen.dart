import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../services/theme_service.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: const Text('Common'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              value: const Text('English'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  isOpen = value;
                });
                ThemeService().switchTheme();
              },
              initialValue: isOpen,
              leading: const Icon(Icons.format_paint),
              title: const Text('Enable custom theme'),
            ),
          ],
        ),
        SettingsSection(
          title: const Text('Common'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              value: const Text('English'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: const Icon(Icons.format_paint),
              title: const Text('Enable custom theme'),
            ),
          ],
        ),
        SettingsSection(
          title: const Text('Common'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              value: const Text('English'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: const Icon(Icons.format_paint),
              title: const Text('Enable custom theme'),
            ),
          ],
        ),
      ],
    );

    //   return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.transparent,
    //       automaticallyImplyLeading: false,
    //       leading: const Icon(
    //         Icons.arrow_back,
    //         size: 30,
    //       ),
    //       iconTheme:
    //           IconThemeData(color: Theme.of(context).textTheme.bodyText1?.color),
    //       title: Text(
    //         'Settings',
    //         style: TextStyle(
    //             color: Theme.of(context).textTheme.bodyText1?.color,
    //             fontSize: 24.0),
    //       ),
    //     ),
    //     body: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         children: [
    //           Row(children: [
    //             CircleAvatar(
    //               radius: screenSize.width * 0.1,
    //               backgroundImage: const AssetImage('assets/images/avatar.jpg'),
    //             ),
    //             const SizedBox(width: 16),
    //             Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: const [
    //                   Text(
    //                     'Madara Uchiha',
    //                     style: TextStyle(
    //                       fontFamily: "Outfit",
    //                       fontSize: 24,
    //                     ),
    //                   ),
    //                   SizedBox(height: 8.0),
    //                   Text("Don't tell anyone, but I'm a ninja! "),
    //                 ],
    //               ),
    //             ),
    //             const SizedBox(width: 40.0),
    //             const Icon(
    //               Icons.qr_code_scanner,
    //               size: 28.0,
    //             )
    //           ]),
    //           const SizedBox(height: 40.0),
    //           Expanded(child: ListView.builder(itemBuilder: (context, index) {
    //             return Column(
    //               children: [
    //                 Row(children: [
    //                   const Icon(
    //                     Icons.person_outline,
    //                     size: 40,
    //                   ),
    //                   const SizedBox(width: 16.0),
    //                   Expanded(
    //                       child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: const [
    //                       Text('Account',
    //                           style: TextStyle(
    //                               fontFamily: 'Outfit',
    //                               fontSize: 22,
    //                               fontWeight: FontWeight.w500),),
    //                       Text(
    //                         'Privacy, secutrity, change email or number',
    //                         style: TextStyle(
    //                           fontFamily: 'Outfit',
    //                         ),
    //                       )
    //                     ],
    //                   ),),
    //                 ]),
    //                 const SizedBox(
    //                   height: 12,
    //                 ),
    //               ],
    //             );
    //           }),)
    //         ],
    //       ),
    //     ),
    //   );
  }
}
