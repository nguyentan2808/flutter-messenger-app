import 'package:flutter/material.dart';

import '../../../constants/theme_constant.dart';
import '../models/item_model.dart';

class SettingRow extends StatelessWidget {
  const SettingRow({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    final bool isEnable = item.handleClick != null;

    return ListTile(
      enabled: isEnable,
      visualDensity: const VisualDensity(vertical: -2),
      leading: Opacity(
        opacity: isEnable ? 1 : 0.5,
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding / 2 + 1),
          decoration: BoxDecoration(
              color: item.iconColor,
              borderRadius: const BorderRadius.all(Radius.circular(100))),
          child: Icon(
            item.icon,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
      trailing: const Icon(Icons.navigate_next),
      title: Text(item.title),
      subtitle: Opacity(
        opacity: isEnable ? 1 : 0.5,
        child: Text(
          item.subTitle,
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1?.color,
              fontSize: 12),
        ),
      ),
      onTap: item.handleClick,
    );
  }
}
