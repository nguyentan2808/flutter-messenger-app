import 'package:flutter/material.dart';

import '../../../constants/theme_constant.dart';

class GroupTitle extends StatelessWidget {
  const GroupTitle({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding * 2 / 3),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 15,
            color:
                Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.6)),
        textAlign: TextAlign.left,
      ),
    );
  }
}
