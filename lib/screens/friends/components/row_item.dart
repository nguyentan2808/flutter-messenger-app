import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/routes_constant.dart';
import '../../../constants/theme_constant.dart';
import '../../../models/user_model.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.profile, arguments: user);
      },
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding * 3 / 4),
        child: Row(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: user.avatar,
                  placeholder: (context, url) => const CircleAvatar(
                      radius: 20, backgroundColor: Colors.grey),
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    backgroundImage: imageProvider,
                    radius: 20,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: -2,
                  child: Container(
                    height: 12,
                    width: 12,
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
            const SizedBox(width: kDefaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  user.status != null && user.name.length % 2 == 0
                      ? Padding(
                          padding:
                              const EdgeInsets.only(right: kDefaultPadding),
                          child: Text(
                            user.status as String,
                            style: const TextStyle(
                                color: Colors.grey,
                                overflow: TextOverflow.ellipsis),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            const Opacity(
              opacity: 0.7,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
