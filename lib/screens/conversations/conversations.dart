import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../chat_detail/chat_detail_screen.dart';
import 'components/app_bar.dart';
import 'components/conversation.dart';
import 'components/horizontal_list.dart';

class Conversations extends StatelessWidget {
  const Conversations({Key? key}) : super(key: key);

  void handleOpenChatDetail() {
    Get.to(
      () => ChatDetailScreen(),
      transition: Transition.cupertinoDialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => index == 0
                  ? const HorizontalList()
                  : Conversation(
                      onPress: () => handleOpenChatDetail(),
                      index: index,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
