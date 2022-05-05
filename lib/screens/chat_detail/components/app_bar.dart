import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constants/routes_constant.dart';
import 'package:lab6/constants/theme_constant.dart';
import 'package:lab6/controllers/auth_controller.dart';

import '../../../models/user_model.dart';

class ChatDetailAppBar extends StatelessWidget with PreferredSizeWidget {
  const ChatDetailAppBar({Key? key, required this.handleChangeTheme})
      : super(key: key);

  final void handleChangeTheme;

  void _goToOptions() {
    UserModel user = Get.put(AuthController()).user.value;
    Get.toNamed(Routes.chatOptions, arguments: [user, handleChangeTheme]);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 1,
      automaticallyImplyLeading: true,
      title: GestureDetector(
        onTap: _goToOptions,
        child: Row(
          children: [
            Stack(children: [
              const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 1),
                  ),
                ),
              )
            ]),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Nguyen Tan',
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Text(
                    'Active 10m ago',
                    style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      actions: [
        const Icon(Icons.call, size: 24),
        Stack(alignment: Alignment.centerRight, children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2 / 3),
            child: Icon(Icons.videocam, size: 24),
          ),
          Positioned(
            right: 2,
            child: Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          )
        ]),
        IconButton(
          onPressed: _goToOptions,
          icon: const Icon(Icons.info_rounded, size: 24),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
