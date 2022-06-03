import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/components/loader_dialog.dart';
import 'package:lab6/components/notification.dart';
import 'package:lab6/constants/routes_constant.dart';
import 'package:lab6/constants/theme_constant.dart';
import 'package:lab6/models/conversation_model.dart';
import 'package:lab6/services/conversations_service.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';

class Conversation extends StatefulWidget {
  const Conversation({Key? key, required this.conversation}) : super(key: key);

  final ConversationModel conversation;

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    UserDetailModel receiver = widget.conversation.users.length >= 3
        ? UserDetailModel.mockData(
            "You and ${widget.conversation.users.length - 1} others")
        : context.read<Auth>().user!.username ==
                widget.conversation.users[0].username
            ? widget.conversation.users[1]
            : widget.conversation.users[0];

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.chatDetail,
            arguments: {"conversation": widget.conversation});
      },
      onLongPress: () {
        openDeleteModal(widget.conversation.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: receiver.avatar != ""
                      ? receiver.avatar
                      : kDefaultAvatarUrl,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 24,
                    backgroundImage: imageProvider,
                  ),
                  placeholder: (context, url) => const CircleAvatar(radius: 24),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 2),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receiver.nickname != "" &&
                              widget.conversation.users.length == 2
                          ? receiver.nickname
                          : widget.conversation.users.length > 2 &&
                                  widget.conversation.name != ""
                              ? widget.conversation.name
                              : receiver.name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 3),
                    widget.conversation.lastMessage != null
                        ? Text(
                            "${widget.conversation.lastMessage!.sender == context.read<Auth>().user!.username ? "You: " : receiver.name} ${widget.conversation.lastMessage!.content}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 13),
                          )
                        : const Text(
                            "No message",
                            style: TextStyle(fontSize: 13),
                          ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Text(
                "conversation_time".trParams({'time': '3'}),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openDeleteModal(String conversationId) {
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
              "conversation_delete_title".tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: kDefaultPadding / 2),
            Text(
              "conversation_delete_content".tr,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('conversation_delete_cancel'.tr),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: Text('conversation_delete_confirm'.tr),
            onPressed: () async {
              try {
                LoaderDialog.show(context, "Deleting...");
                await ConversationsService(context)
                    .deleteConversation(conversationId);
                LoaderDialog.hide();
                Get.back();
                NotificationDialog.show(context, "Delete conversation",
                    "Delete conversation successfully");
              } catch (error) {
                LoaderDialog.hide();

                NotificationDialog.show(context, "Error", error.toString());
              }
            },
          ),
        ],
      ),
    );
  }
}
