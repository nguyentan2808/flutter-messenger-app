import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constants/theme_constant.dart';
import '../../api/index.dart';
import '../../components/loader_dialog.dart';
import '../../constants/routes_constant.dart';
import '../../models/conversation_model.dart';
import '../../providers/conversations_provider.dart';
import 'components/app_bar.dart';
import 'components/circle_option.dart';
import 'components/group_title.dart';
import 'components/row_option.dart';
import 'components/user_preview.dart';
import 'utils/open_change_theme_dialog.dart';

class ChatOptionsScreen extends StatefulWidget {
  const ChatOptionsScreen({Key? key}) : super(key: key);

  @override
  State<ChatOptionsScreen> createState() => _ChatOptionsScreenState();
}

class _ChatOptionsScreenState extends State<ChatOptionsScreen> {
  final UserDetailModel receiver = Get.arguments["receiver"];

  final void Function(String) handleChangeTheme =
      Get.arguments["handleChangeTheme"];
  final Function(String, String) updateNickNameConversation =
      Get.arguments["updateNickNameConversation"];
  final ConversationModel conversation = Get.arguments["conversation"];
  final Function(String) updateNameConversation =
      Get.arguments["updateNameConversation"];

  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

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
                      "updateNickNameConversation": updateNickNameConversation
                    });
                  },
                ),
                conversation != null && conversation.users.length > 2
                    ? RowOption(
                        icon: Icons.edit,
                        text: "chat_detail_options_change_name".tr,
                        onTap: openEditNameDialog,
                      )
                    : Container(),
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

  void openEditNameDialog() {
    _nameController.text = conversation.name;

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "chat_detail_options_change_name".tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: kDefaultPadding / 2),
            TextField(controller: _nameController),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () async {
              try {
                LoaderDialog.show(context);

                await API().editName(conversation.id, _nameController.text);
                updateNameConversation(_nameController.text);
                context
                    .read<ConversationsProvider>()
                    .updateName(conversation.id, _nameController.text);
                LoaderDialog.hide();
              } catch (error) {
                LoaderDialog.hide();
              }
            },
          ),
        ],
      ),
    );
  }
}
