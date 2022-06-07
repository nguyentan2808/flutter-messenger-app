import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/message_model.dart';
import '../../../providers/messages_provider.dart';
import '../../../providers/socket_provider.dart';

class ItemModel {
  String src;
  String name;

  ItemModel(this.src, this.name);
}

class MenuReaction extends StatelessWidget {
  MenuReaction({
    Key? key,
    required this.controller,
    required this.message,
  }) : super(key: key);

  final List<ItemModel> menuReactions = [
    ItemModel("assets/images/like.gif", "Like"),
    ItemModel("assets/images/love.gif", "Love"),
    ItemModel("assets/images/wow.gif", "Haha"),
    ItemModel("assets/images/sad.gif", "Sad"),
    ItemModel("assets/images/haha.gif", "Like"),
    ItemModel("assets/images/angry.gif", "Angry"),
  ];

  final CustomPopupMenuController controller;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    print(message.id);
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
                  controller.hideMenu();
                  context
                      .read<MessageProvider>()
                      .reaction(message.id, item.src);
                  context.read<SocketProvider>().socket.emit("reaction", {
                    "conversationId": message.conversationId,
                    "id": message.id,
                    "reaction": item.src,
                  });
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
