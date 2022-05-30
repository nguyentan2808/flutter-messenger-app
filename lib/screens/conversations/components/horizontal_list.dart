import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../components/notification.dart';
import '../../../constants/theme_constant.dart';
import '../../../models/user_model.dart';
import '../../../providers/friends_provider.dart';
import '../../../services/friends_service.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  Future fetchFriends() async {
    try {
      FriendsService(context).fetchFriends();
    } catch (e) {
      NotificationDialog.show(context, "Error", e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFriends();
  }

  @override
  Widget build(BuildContext context) {
    final List<UserModel> users = context.watch<FriendsProvider>().users;

    return Container(
      height: 100,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, index) => index == 0
                  ? Row(
                      children: [
                        const AddMorePeople(),
                        People(user: users[index])
                      ],
                    )
                  : People(user: users[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class People extends StatelessWidget {
  const People({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      width: Get.width / 6,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: user.avatar == "" ? kDefaultAvatarUrl : user.avatar,
            placeholder: (context, url) =>
                const CircleAvatar(radius: 20, backgroundColor: Colors.grey),
            imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundImage: imageProvider,
              radius: 20,
            ),
          ),
          Text(
            user.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

class AddMorePeople extends StatelessWidget {
  const AddMorePeople({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 6,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[200],
            child: const Icon(
              Icons.add,
              color: Colors.black87,
            ),
          ),
          Text(
            "conversation_add".tr,
            maxLines: 2,
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
