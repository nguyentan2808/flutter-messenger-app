import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Conversation extends StatelessWidget {
  const Conversation({Key? key, required this.onPress, required this.index})
      : super(key: key);
  final int index;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(index % 2 == 0
                      ? 'assets/images/avatar.jpg'
                      : 'assets/images/avatar2.jpg'),
                ),
                if (index % 2 == 0)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 2),
                      ),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Jenny Wilson',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Hope you are doing well',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Text(
                "conversation_time".trParams({'time': '3m'}),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
