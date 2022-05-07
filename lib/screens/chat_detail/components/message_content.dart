import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';
import '../models/message_model.dart';

class MessageContent extends StatelessWidget {
  const MessageContent({Key? key, required this.isMe, required this.message})
      : super(key: key);

  final bool isMe;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        message.type != MessageType.text
            ? CachedNetworkImage(
                imageUrl: message.mediaUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: Get.width * 0.4,
                  height: Get.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: kDefaultPadding / 2),
                constraints: BoxConstraints(maxWidth: Get.width * 0.6),
                decoration: BoxDecoration(
                    color: message.isUnSend
                        ? Colors.transparent
                        : Theme.of(context)
                            .primaryColor
                            .withOpacity(isMe ? 1 : 0.1),
                    border: Border.all(
                      color: Theme.of(context)
                          .primaryColor
                          .withOpacity(isMe ? 0.5 : 0.1),
                    ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 40,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ]),
                child: message.isUnSend
                    ? Text(
                        "chat_detail_unsent".tr,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic, // italic
                        ),
                      )
                    : Text(
                        message.text,
                        style: TextStyle(
                          color: Get.isDarkMode
                              ? Colors.white
                              : isMe
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
              ),
        if (isMe)
          Container(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Icon(
              Icons.check_circle_rounded,
              size: 14,
              color: Theme.of(context).primaryColor,
            ),
          )
      ],
    );
  }
}
