import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';
import '../../../models/user_model.dart';

class UserPreview extends StatelessWidget {
  const UserPreview({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl: user.avatar as String,
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
          user.name,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
