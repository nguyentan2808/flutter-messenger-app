import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:lab6/models/message_model.dart';

import '../constants/theme_constant.dart';

class NotificationDialog {
  static void show(BuildContext context, String title, String body,
      {bool isPrimary = false, int duration = 3000}) {
    Get.snackbar(
      title,
      body,
      borderWidth: 2,
      backgroundColor: isPrimary ? Theme.of(context).primaryColor : null,
      colorText: isPrimary ? Colors.white : Colors.black,
      borderRadius: kDefaultRadius / 2,
      snackPosition: SnackPosition.TOP,
      duration: Duration(milliseconds: duration),
      margin: const EdgeInsets.all(kDefaultPadding / 2),
      animationDuration: const Duration(milliseconds: 400),
      mainButton: TextButton(
        onPressed: () => Get.back(),
        child: Icon(
          Icons.close,
          color: isPrimary ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  static void notifyNewMessage(BuildContext context, data) {
    FlutterLocalNotificationsPlugin().show(
      2,
      "Oke",
      "oke1111",
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "channel.id",
          "channel.name",
          channelDescription: "channel.description",
          importance: Importance.max,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
    // print(data);
    // Get.snackbar(
    //   "",
    //   "",
    //   titleText: Row(),
    //   messageText: Row(
    //     children: [
    //       Text(data["sender"]),
    //       Text(
    //         data['content'],
    //         maxLines: 2,
    //         overflow: TextOverflow.ellipsis,
    //         style: const TextStyle(
    //           color: Colors.white,
    //         ),
    //       ),
    //     ],
    //   ),
    //   icon: CachedNetworkImage(
    //     imageUrl: data["avatar"] != "" ? data["avatar"] : kDefaultAvatarUrl,
    //     imageBuilder: (context, imageProvider) => Padding(
    //       padding: const EdgeInsets.all(kDefaultPadding / 4),
    //       child: CircleAvatar(
    //         radius: 30,
    //         backgroundImage: imageProvider,
    //       ),
    //     ),
    //     placeholder: (context, url) => const CircleAvatar(radius: 24),
    //   ),
    //   borderWidth: 2,
    //   colorText: Colors.white,
    //   borderRadius: kDefaultRadius / 2,
    //   snackPosition: SnackPosition.TOP,
    //   margin: const EdgeInsets.all(kDefaultPadding / 2),
    //   animationDuration: const Duration(milliseconds: 400),
    //   mainButton: TextButton(
    //     onPressed: () => Get.back(),
    //     child: const Icon(Icons.close, color: Colors.white),
    //   ),
    // );
  }
}
