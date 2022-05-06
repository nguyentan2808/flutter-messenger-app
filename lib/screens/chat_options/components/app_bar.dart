import 'package:flutter/material.dart';

import '../../../constants/theme_constant.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        Icon(Icons.more_vert),
        SizedBox(
          width: kDefaultPadding,
        )
      ],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: Theme.of(context).textTheme.bodyText1?.color,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
