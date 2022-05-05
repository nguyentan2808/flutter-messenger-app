import 'package:flutter/material.dart';

import '../../../constants/theme_constant.dart';
import '../models/item_model.dart';
import 'setting_row.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({Key? key, required this.title, required this.list})
      : super(key: key);
  final String title;
  final List<ItemModel> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ),
          ...list.map((item) => SettingRow(item: item)).toList(),
        ],
      ),
    );
  }
}
