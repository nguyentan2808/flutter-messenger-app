import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/models/conversation_model.dart';

import '../../../constants/routes_constant.dart';
import '../../../constants/theme_constant.dart';

class ChatDetailAppBar extends StatefulWidget with PreferredSizeWidget {
  const ChatDetailAppBar({
    Key? key,
    required this.handleChangeTheme,
    required this.conversation,
    required this.receiver,
  }) : super(key: key);

  final Function(String) handleChangeTheme;
  final ConversationModel? conversation;
  final UserDetailModel receiver;

  @override
  State<ChatDetailAppBar> createState() => _ChatDetailAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ChatDetailAppBarState extends State<ChatDetailAppBar> {
  void _goToOptions(UserDetailModel receiver) {
    Get.toNamed(Routes.chatOptions,
        arguments: [receiver, widget.handleChangeTheme]);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 1,
      automaticallyImplyLeading: true,
      title: GestureDetector(
        onTap: () => _goToOptions(widget.receiver),
        child: Row(
          children: [
            Stack(children: [
              CachedNetworkImage(
                imageUrl: widget.receiver.avatar == ""
                    ? kDefaultAvatarUrl
                    : widget.receiver.avatar,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 16,
                  backgroundImage: imageProvider,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 1),
                  ),
                ),
              )
            ]),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.receiver.name,
                  style: const TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    'chat_detail_offline'.trParams({
                      'time': '10m',
                    }),
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      actions: [
        const Icon(Icons.call, size: 24),
        Stack(alignment: Alignment.centerRight, children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2 / 3),
            child: Icon(Icons.videocam, size: 24),
          ),
          Positioned(
            right: 2,
            child: Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          )
        ]),
        IconButton(
          onPressed: () => _goToOptions(widget.receiver),
          icon: const Icon(Icons.info_rounded, size: 24),
        ),
      ],
    );
  }
}
