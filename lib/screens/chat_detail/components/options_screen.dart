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
                buildCircleOption(Icons.call, "chat_detail_options_call".tr),
                const SizedBox(width: kDefaultPadding * 2),
                buildCircleOption(
                    Icons.video_call, "chat_detail_options_video".tr),
                const SizedBox(width: kDefaultPadding * 2),
                buildCircleOption(
                    Icons.person, "chat_detail_options_profile".tr),
                const SizedBox(width: kDefaultPadding * 2),
                buildCircleOption(
                    Icons.notifications, "chat_detail_options_mute".tr),
              ],
            ),
            const SizedBox(height: kDefaultPadding),
            Column(
              children: [
                buildRowOption(Icons.thermostat, "chat_detail_options_theme".tr,
                    () {
                  buildChangeThemeDialog(context);
                }),
                buildRowOption(
                    Icons.color_lens, "chat_detail_options_nickname".tr, () {}),
                buildGroupTitle(context, "chat_detail_options_more".tr),
                buildRowOption(
                    Icons.image, "chat_detail_options_media".tr, () {}),
                buildRowOption(
                    Icons.search, "chat_detail_options_search".tr, () {}),
                buildRowOption(
                    Icons.notifications, "chat_detail_options_sound".tr, () {}),
                buildRowOption(
                    Icons.lock, "chat_detail_options_secret".tr, () {}),
                buildRowOption(
                    Icons.group,
                    "chat_detail_options_create_group"
                        .trParams({"name": "Nguyen Tan 2"}),
                    () {}),
                buildGroupTitle(context, "chat_detail_options_privacy".tr),
                buildRowOption(
                    Icons.wifi_off, "chat_detail_options_restrict".tr, () {}),
                buildRowOption(
                    Icons.block, "chat_detail_options_block".tr, () {}),
                buildRowOption(
                    Icons.report, "chat_detail_options_report".tr, () {}),
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
                title: Text("chat_detail_options_customize".tr),
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
      "chat_detail_options_snack_bar_title".tr,
      "chat_detail_options_snack_bar_desc"
          .trParams({"color": capitalize(item.key)}),
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
