import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constant.dart';

class MessageDisplay extends StatelessWidget {
  const MessageDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 31,
        itemBuilder: (context, index) => Message(isMe: index % 2 == 0),
      ),
    );
  }
}

class Message extends StatefulWidget {
  const Message({
    Key? key,
    required this.isMe,
  }) : super(key: key);

  final bool isMe;

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  bool isShowDetail = false;

  void _handleShowDetail() {
    setState(() {
      isShowDetail = !isShowDetail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleShowDetail,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        child: Row(
          mainAxisAlignment:
              widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: widget.isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    height: isShowDetail ? null : 0.0,
                    padding: EdgeInsets.only(
                        bottom: kDefaultPadding / 5,
                        left: widget.isMe ? 0 : 40,
                        right: widget.isMe ? 28 : 0),
                    child: const Text(
                      "15 THG 4 Lúc 10:42",
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                Row(
                  children: [
                    if (!widget.isMe)
                      Container(
                        padding:
                            const EdgeInsets.only(right: kDefaultPadding / 2),
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/avatar.jpg"),
                          radius: 14,
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .primaryColor
                              .withOpacity(widget.isMe ? 1 : 0.1),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 40,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ]),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: Get.width * 0.5),
                        child: Text(
                          "Hello, how it's going? Hello, how it's going? Hello, how it's going? Hello, how it's going? ",
                          style: TextStyle(
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : widget.isMe
                                      ? Colors.white
                                      : Colors.black),
                        ),
                      ),
                    ),
                    if (widget.isMe)
                      Container(
                        padding:
                            const EdgeInsets.only(left: kDefaultPadding / 4),
                        child: Icon(
                          Icons.check_circle_rounded,
                          size: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                  ],
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    height: isShowDetail ? null : 0.0,
                    padding: EdgeInsets.only(
                        left: widget.isMe ? 0 : 42,
                        right: widget.isMe ? 28 : 0),
                    child: Text(
                      widget.isMe ? "Đã gửi" : "Đã xem",
                      style: const TextStyle(fontSize: 11),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
