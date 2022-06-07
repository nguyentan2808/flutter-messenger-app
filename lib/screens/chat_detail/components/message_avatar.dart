import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/theme_constant.dart';
import '../../../models/conversation_model.dart';
import '../../../models/message_model.dart';

class MessageAvatar extends StatelessWidget {
  const MessageAvatar({
    Key? key,
    required this.isMe,
    required this.isShowAvatar,
    required this.message,
    required this.conversation,
  }) : super(key: key);

  final bool isMe;
  final bool isShowAvatar;
  final MessageModel message;
  final ConversationModel? conversation;

  @override
  Widget build(BuildContext context) {
    UserDetailModel user = conversation!.users
        .firstWhere((element) => element.username == message.sender);

    if (!isMe) {
      return Container(
        padding: const EdgeInsets.only(right: kDefaultPadding / 2),
        // child: CircleAvatar(
        //   backgroundImage: isShowAvatar
        //       ? const AssetImage("assets/images/avatar.jpg")
        //       : null,
        //   backgroundColor: Colors.transparent,
        //   radius: 14,
        // ),
        child: isShowAvatar
            ? CachedNetworkImage(
                imageUrl: user.avatar != "" ? user.avatar : kDefaultAvatarUrl,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 14,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => const CircleAvatar(radius: 14),
              )
            : const CircleAvatar(
                radius: 14,
                backgroundColor: Colors.transparent,
              ),
      );
    } else {
      return Container();
    }
  }
}
