import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constants/routes_constant.dart';
import '../../constants/theme_constant.dart';
import '../../providers/auth_provider.dart';
import 'components/friends_tab.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(Routes.searchPeople),
                icon: const Icon(Icons.search))
          ],
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding / 2,
                ),
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
              Text('friends_title'.tr),
            ],
          ),
          bottom: TabBar(
            indicatorPadding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "friends_friend_tab".tr),
              Tab(text: "friends_people_tab".tr),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FriendsTab(),
            Center(child: Text("Developing...🚀")),
          ],
        ),
      ),
    );
  }
}
