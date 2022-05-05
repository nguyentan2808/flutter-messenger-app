import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constants/theme_constant.dart';

class ItemModel {
  String src;
  String name;

  ItemModel(this.src, this.name);
}

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
  final CustomPopupMenuController _controller = CustomPopupMenuController();

  void _handleShowDetail() {
    setState(() {
      isShowDetail = !isShowDetail;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMe = widget.isMe;

    return CustomPopupMenu(
      showArrow: false,
      verticalMargin: 0,
      horizontalMargin: 0,
      controller: _controller,
      barrierColor: Colors.transparent,
      pressType: PressType.longPress,
      menuBuilder: () => !isMe ? _buildLongPressMenu() : Container(),
      child: GestureDetector(
        onTap: _handleShowDetail,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  MessageTime(isShowDetail: isShowDetail, isMe: isMe),
                  Row(
                    children: [
                      MessageAvatar(isMe: isMe),
                      MessageContent(isMe: isMe),
                    ],
                  ),
                  MessageStatus(isShowDetail: isShowDetail, isMe: isMe),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLongPressMenu() {
    final List<ItemModel> menuReactions = [
      ItemModel("assets/images/like.gif", "Like"),
      ItemModel("assets/images/love.gif", "Love"),
      ItemModel("assets/images/wow.gif", "Haha"),
      ItemModel("assets/images/sad.gif", "Sad"),
      ItemModel("assets/images/haha.gif", "Like"),
      ItemModel("assets/images/angry.gif", "Angry"),
    ];

    return Container(
      width: 230,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 20,
              color: Colors.black.withOpacity(0.2),
            )
          ]),
      child: GridView.count(
        padding: const EdgeInsets.all(0),
        crossAxisCount: 6,
        // mainAxisSpacing: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: menuReactions
            .map(
              (item) => GestureDetector(
                onTap: () {
                  _controller.hideMenu();
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    item.src,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class MessageStatus extends StatelessWidget {
  const MessageStatus({
    Key? key,
    required this.isShowDetail,
    required this.isMe,
  }) : super(key: key);

  final bool isShowDetail;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: isShowDetail ? null : 0.0,
        padding: EdgeInsets.only(left: isMe ? 0 : 42, right: isMe ? 28 : 0),
        child: Text(
          isMe ? "Đã gửi" : "Đã xem",
          style: const TextStyle(fontSize: 11),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}

class MessageTime extends StatelessWidget {
  const MessageTime({
    Key? key,
    required this.isShowDetail,
    required this.isMe,
  }) : super(key: key);

  final bool isShowDetail;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: isShowDetail ? null : 0.0,
        padding: EdgeInsets.only(
            bottom: kDefaultPadding / 5,
            left: isMe ? 0 : 40,
            right: isMe ? 28 : 0),
        child: const Text(
          "15 THG 4 Lúc 10:42",
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}

class MessageAvatar extends StatelessWidget {
  const MessageAvatar({
    Key? key,
    required this.isMe,
  }) : super(key: key);

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    if (!isMe) {
      return Container(
        padding: const EdgeInsets.only(right: kDefaultPadding / 2),
        child: const CircleAvatar(
          backgroundImage: AssetImage("assets/images/avatar.jpg"),
          radius: 14,
        ),
      );
    } else {
      return Container();
    }
  }
}

class MessageContent extends StatelessWidget {
  const MessageContent({
    Key? key,
    required this.isMe,
  }) : super(key: key);

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          constraints: BoxConstraints(maxWidth: Get.width * 0.6),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(isMe ? 1 : 0.1),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 40,
                  color: Colors.black.withOpacity(0.1),
                ),
              ]),
          child: Text(
            "Hello, how it's going? Hello, how it's going? Hello, how it's going? Hello, how it's going? ",
            style: TextStyle(
                color: Get.isDarkMode
                    ? Colors.white
                    : isMe
                        ? Colors.white
                        : Colors.black),
          ),
        ),
        if (isMe)
          Container(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Icon(
              Icons.check_circle_rounded,
              size: 14,
              color: Theme.of(context).primaryColor,
            ),
          )
      ],
    );
  }
}
