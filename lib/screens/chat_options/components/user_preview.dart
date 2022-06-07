import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';
import '../../../models/conversation_model.dart';

class UserPreview extends StatelessWidget {
  const UserPreview({Key? key, required this.receiver}) : super(key: key);

  final UserDetailModel receiver;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl: receiver.avatar,
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
          receiver.name,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
