import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constants/routes_constant.dart';
import 'package:lab6/models/conversation_model.dart';

import '../../../constants/theme_constant.dart';
import 'components/app_bar.dart';
import 'components/circle_option.dart';
import 'components/group_title.dart';
import 'components/row_option.dart';
import 'components/user_preview.dart';
import 'utils/open_change_theme_dialog.dart';

class ChatOptionsScreen extends StatelessWidget {
  ChatOptionsScreen({Key? key}) : super(key: key);

  final UserDetailModel receiver = Get.arguments["receiver"];
  final void Function(String) handleChangeTheme =
      Get.arguments["handleChangeTheme"];
  final Function(String, String) updateConversation =
      Get.arguments["updateConversation"];

  final ConversationModel conversation = Get.arguments["conversation"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserPreview(receiver: receiver),
            const SizedBox(height: kDefaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleOption(
                    icon: Icons.call, text: "chat_detail_options_call".tr),
                const SizedBox(width: kDefaultPadding * 1.75),
                CircleOption(
                    icon: Icons.video_call,
                    text: "chat_detail_options_video".tr),
                const SizedBox(width: kDefaultPadding * 1.75),
                CircleOption(
                    icon: Icons.person, text: "chat_detail_options_profile".tr),
                const SizedBox(width: kDefaultPadding * 1.75),
                CircleOption(
                    icon: Icons.notifications,
                    text: "chat_detail_options_mute".tr),
              ],
            ),
            const SizedBox(height: kDefaultPadding),
            Column(
              children: [
                RowOption(
                    icon: Icons.color_lens,
                    text: "chat_detail_options_theme".tr,
                    onTap: () {
                      openChangeThemeDialog(
                        context,
                        handleChangeTheme,
                      );
                    }),
                RowOption(
                    icon: Icons.person,
                    text: "chat_detail_options_nickname".tr,
                    onTap: () {
                      Get.toNamed(Routes.changeNickName, arguments: {
                        "conversation": conversation,
                        "updateConversation": updateConversation
                      });
                    }),
                GroupTitle(text: "chat_detail_options_more".tr),
                RowOption(
                    icon: Icons.image,
                    text: "chat_detail_options_media".tr,
                    onTap: () {}),
                RowOption(
                    icon: Icons.search,
                    text: "chat_detail_options_search".tr,
                    onTap: () {}),
                RowOption(
                    icon: Icons.notifications,
                    text: "chat_detail_options_sound".tr,
                    onTap: () {}),
                RowOption(
                    icon: Icons.lock,
                    text: "chat_detail_options_secret".tr,
                    onTap: () {}),
                RowOption(
                    icon: Icons.group,
                    text: "chat_detail_options_create_group"
                        .trParams({"name": "Nguyen Tan 2"}),
                    onTap: () {}),
                GroupTitle(text: "chat_detail_options_privacy".tr),
                RowOption(
                    icon: Icons.wifi_off,
                    text: "chat_detail_options_restrict".tr,
                    onTap: () {}),
                RowOption(
                    icon: Icons.block,
                    text: "chat_detail_options_block".tr,
                    onTap: () {}),
                RowOption(
                    icon: Icons.report,
                    text: "chat_detail_options_report".tr,
                    onTap: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
