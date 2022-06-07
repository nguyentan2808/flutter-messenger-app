import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constants/theme_constant.dart';
import '../../../providers/auth_provider.dart';

class SettingAppBar extends StatelessWidget with PreferredSizeWidget {
  const SettingAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: CachedNetworkImage(
              imageUrl: context.watch<Auth>().user?.avatar == ""
                  ? kDefaultAvatarUrl
                  : context.watch<Auth>().user?.avatar as String,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
                radius: 18,
              ),
              placeholder: (context, url) => const CircleAvatar(radius: 18),
              errorWidget: (context, url, error) => const CircleAvatar(
                radius: 18,
              ),
            ),
          ),
          const SizedBox(width: kDefaultPadding),
          Text('setting_title'.tr),
        ],
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
