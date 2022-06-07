import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constants/routes_constant.dart';
import '../../../constants/theme_constant.dart';
import '../../../providers/auth_provider.dart';

class ProfilePreview extends StatelessWidget {
  const ProfilePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.profile),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: kDefaultPadding),
            width: Get.width * 1 / 4,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: context.watch<Auth>().user?.avatar == ""
                      ? kDefaultAvatarUrl
                      : context.watch<Auth>().user?.avatar as String,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    backgroundImage: imageProvider,
                    radius: Get.width * 1 / 8,
                  ),
                  placeholder: (context, url) => Center(
                    child: CircleAvatar(
                      radius: Get.width * 1 / 8,
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: CircleAvatar(
                      radius: Get.width * 1 / 8,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            context.select((Auth auth) => auth.user!.name),
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
