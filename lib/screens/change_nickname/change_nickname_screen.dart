import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../api/index.dart';
import '../../components/loader_dialog.dart';
import '../../constants/theme_constant.dart';
import '../../models/conversation_model.dart';
import '../../providers/conversations_provider.dart';

class ChangeNicknameScreen extends StatefulWidget {
  const ChangeNicknameScreen({Key? key}) : super(key: key);

  @override
  State<ChangeNicknameScreen> createState() => ChangeNicknameScreenState();
}

class ChangeNicknameScreenState extends State<ChangeNicknameScreen> {
  ConversationModel conversation = Get.arguments["conversation"];
  final Function(String, String) updateNickNameConversation =
      Get.arguments["updateNickNameConversation"];

  final TextEditingController _nicknameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nicknameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("chat_detail_options_nickname".tr)),
      body: ListView.builder(
        itemCount: conversation.users.length,
        itemBuilder: (_, index) {
          UserDetailModel user = conversation.users[index];
          return ListTile(
            leading: CachedNetworkImage(
              imageUrl: user.avatar != "" ? user.avatar : kDefaultAvatarUrl,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 20,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => const CircleAvatar(radius: 20),
            ),
            title: Text(
              user.nickname != ""
                  ? user.nickname
                  : "chat_detail_options_change_nickname".tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(user.name),
            onTap: () {
              _nicknameController.text = user.nickname;
              openChangeDialog(user.username);
            },
          );
        },
      ),
    );
  }

  void openChangeDialog(String username) {
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
              "chat_detail_options_change_nickname".tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: kDefaultPadding / 2),
            Text(
              "chat_detail_options_change_nickname_desc".tr,
              style: const TextStyle(fontSize: 13),
            ),
            TextField(controller: _nicknameController),
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
                if (_nicknameController.text != "") {
                  LoaderDialog.show(context, "Changing nickname...");
                  await API().editNickName(
                      conversation.id, username, _nicknameController.text);

                  updateNickNameConversation(
                      username, _nicknameController.text);

                  ConversationModel? clone = conversation;
                  for (var user in clone.users) {
                    if (user.username == username) {
                      user.nickname = _nicknameController.text;
                    }
                  }

                  context.read<ConversationsProvider>().updateNickName(
                      conversation.id, username, _nicknameController.text);

                  setState(() => conversation = clone);
                  LoaderDialog.hide();
                  Get.back();

                  _nicknameController.clear();
                }
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
