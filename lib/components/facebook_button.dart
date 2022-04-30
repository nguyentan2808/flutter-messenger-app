import 'package:flutter/material.dart';

import '../constant.dart';

class FaceBookButton extends StatelessWidget {
  const FaceBookButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.isActive,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    Color color = isActive ? Colors.white : Colors.black;

    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(10),
      elevation: 0,
      color: isActive ? Theme.of(context).primaryColor : Colors.grey[200],
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: color),
          text != ""
              ? Row(
                  children: [
                    const SizedBox(width: kDefaultPadding / 2),
                    Text(
                      text,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, color: color),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
