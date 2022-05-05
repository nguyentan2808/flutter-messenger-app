import 'package:flutter/material.dart';

import '../../../constants/theme_constant.dart';

class SettingAppBar extends StatelessWidget with PreferredSizeWidget {
  const SettingAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
          ),
          SizedBox(width: kDefaultPadding),
          Text('Settings'),
        ],
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
