import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/models/user_model.dart';
import 'package:lab6/screens/chat_detail/data/theme_color_list_data.dart';

import '../../../constants/theme_constant.dart';

class ChatOptionsScreen extends StatelessWidget {
  ChatOptionsScreen({Key? key}) : super(key: key);

  final UserModel user = Get.arguments[0];
  final void Function(String) handleChangeTheme = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.more_vert),
          SizedBox(
            width: kDefaultPadding,
          )
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).textTheme.bodyText1?.color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildPreview(context),
            const SizedBox(height: kDefaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCircleOption(Icons.call, "Call"),
                const SizedBox(width: kDefaultPadding * 2),
                buildCircleOption(Icons.video_call, "Video"),
                const SizedBox(width: kDefaultPadding * 2),
                buildCircleOption(Icons.person, "Profile"),
                const SizedBox(width: kDefaultPadding * 2),
                buildCircleOption(Icons.notifications, "Mute"),
              ],
            ),
            const SizedBox(height: kDefaultPadding),
            Column(
              children: [
                buildRowOption(Icons.thermostat, "Theme", () {
                  buildChangeThemeDialog(context);
                }),
                buildRowOption(Icons.nordic_walking, "Nick names", () {}),
                buildGroupTitle(context, "More actions"),
                buildRowOption(Icons.image, "View media and files", () {}),
                buildRowOption(Icons.search, "Search in conversation", () {}),
                buildRowOption(
                    Icons.notifications, "Notification and sounds", () {}),
                buildRowOption(Icons.lock, "Go to secret conversation", () {}),
                buildRowOption(Icons.group, "Create group chat with", () {}),
                buildGroupTitle(context, "Privacy"),
                buildRowOption(Icons.wifi_off, "Restrict", () {}),
                buildRowOption(Icons.block, "Block", () {}),
                buildRowOption(Icons.report, "Report", () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildGroupTitle(BuildContext context, String text) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding * 2 / 3),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 15,
            color:
                Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.6)),
        textAlign: TextAlign.left,
      ),
    );
  }

  Column buildCircleOption(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: Icon(icon,
              size: 20, color: Get.isDarkMode ? Colors.white : Colors.black),
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? Colors.white.withOpacity(0.1)
                : Colors.grey[100],
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        const SizedBox(height: kDefaultPadding / 2),
        Text(text, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget buildRowOption(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 2 / 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: Icon(icon,
                  size: 18,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? Colors.white.withOpacity(0.1)
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildPreview(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl: user.avatar as String,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
                radius: Get.width * 1 / 8,
              ),
              placeholder: (context, url) => CircleAvatar(
                radius: Get.width * 1 / 8,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 3,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: kDefaultPadding / 2),
        Text(
          user.name,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  String capitalize(String text) {
    return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
  }

  void buildChangeThemeDialog(BuildContext context) {
    Get.back();
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 3),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(kDefaultRadius),
          ),
          child: Column(
            children: [
              ListTile(
                title: const Text("Customize your chat"),
                trailing: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.all(kDefaultPadding / 3),
                    child: Icon(Icons.close,
                        size: 18,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.1)
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ...listThemeColor.entries
                        .map(
                          (entry) => ListTile(
                            onTap: () {
                              handleChangeTheme(entry.key);
                              buildSnackBarChangeColor(entry);
                            },
                            title: Text(capitalize(entry.key)),
                            leading: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: entry.value,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        )
                        .toList()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buildSnackBarChangeColor(item) {
    Get.snackbar(
      "Theme changed",
      "Your theme has been changed to ${capitalize(item.key)}",
      backgroundColor: item.value,
      colorText: Colors.white,
      borderColor: item.value,
      borderWidth: 2,
      borderRadius: kDefaultRadius,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(kDefaultPadding / 2),
      animationDuration: const Duration(milliseconds: 500),
    );
  }
}
