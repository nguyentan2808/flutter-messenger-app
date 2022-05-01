import 'package:flutter/material.dart';

import '../constant.dart';

class FaceBookButton extends StatelessWidget {
  const FaceBookButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Color color = isActive ? Colors.white : Colors.black.withOpacity(0.8);

    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(10),
      elevation: 0,
      color: isActive ? Theme.of(context).primaryColor : Colors.grey[200],
      onPressed: onPressed,
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
