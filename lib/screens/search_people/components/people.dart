import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';
import '../../../models/user_model.dart';

class People extends StatelessWidget {
  const People({Key? key, required this.user, required this.handleRemove})
      : super(key: key);

  final UserModel user;
  final Function()? handleRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 5,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding / 3),
                child: CachedNetworkImage(
                  imageUrl: user.avatar == "" ? kDefaultAvatarUrl : user.avatar,
                  placeholder: (context, url) => const CircleAvatar(
                      radius: 22, backgroundColor: Colors.grey),
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    backgroundImage: imageProvider,
                    radius: 22,
                  ),
                ),
              ),
              handleRemove != null
                  ? Positioned(
                      top: 0,
                      right: -1,
                      child: InkWell(
                        onTap: () {
                          handleRemove!();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                width: 2),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 12,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
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
