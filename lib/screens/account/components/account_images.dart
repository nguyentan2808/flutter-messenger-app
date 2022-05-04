import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';

class AccountImages extends StatelessWidget {
  const AccountImages({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 3,
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.only(bottom: Get.width / 12),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: user.coverPhoto as String,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: user.avatar as String,
                imageBuilder: (context, imageProvider) => Container(
                  width: Get.width / 3,
                  height: Get.width / 3,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0)),
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 4,
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
                      color: Colors.grey[200],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
