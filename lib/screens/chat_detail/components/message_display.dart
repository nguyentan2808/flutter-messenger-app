import 'package:flutter/material.dart';
import 'package:lab6/services/theme_service.dart';

class MessageDisplay extends StatelessWidget {
  const MessageDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 31,
        itemBuilder: (context, index) => Message(index: index),
      ),
    );
  }
}

class Message extends StatelessWidget {
  Message({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  final isDarkMode = ThemeService().theme == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          index % 2 == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: Row(
            children: [
              if (index % 2 != 0)
                Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/avatar.jpg"),
                      radius: 14,
                    ),
                    SizedBox(width: 8)
                  ],
                ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .primaryColor
                        .withOpacity(index % 2 == 0 ? 1 : 0.1),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 40,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ]),
                child: Text(
                  "Hello, how it's going?",
                  style: TextStyle(
                      color: isDarkMode
                          ? Colors.white
                          : index % 2 == 0
                              ? Colors.white
                              : Colors.black),
                ),
              ),
              if (index % 2 == 0)
                Row(
                  children: [
                    const SizedBox(width: 4.0),
                    Icon(
                      Icons.check_circle_rounded,
                      size: 14,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                )
            ],
          ),
        ),
      ],
    );
  }
}
