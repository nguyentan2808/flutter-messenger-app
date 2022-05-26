import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constants/routes_constant.dart';
import 'package:lab6/constants/theme_constant.dart';
import 'package:lab6/models/conversation_model.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';

class Conversation extends StatelessWidget {
  const Conversation({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  final ConversationModel conversation;

  @override
  Widget build(BuildContext context) {
    UserDetailModel receiver =
        context.read<Auth>().user!.username == conversation.users[0].username
            ? conversation.users[1]
            : conversation.users[0];

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.chatDetail,
            arguments: {"conversation": conversation});
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
                      receiver.name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "${conversation.lastMessage.sender == context.read<Auth>().user!.username ? "You: " : receiver.name} ${conversation.lastMessage.content}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13),
                    )
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
}
