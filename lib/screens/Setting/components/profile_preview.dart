import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/routes_constant.dart';
import '../../../constants/theme_constant.dart';
import '../../../controllers/auth_controller.dart';

class ProfilePreview extends StatelessWidget {
  ProfilePreview({Key? key}) : super(key: key);

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.profile),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/avatar.jpg'),
                  radius: Get.width * 1 / 8,
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
            const SizedBox(height: kDefaultPadding / 2),
            Text(
              _authController.user.value.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
