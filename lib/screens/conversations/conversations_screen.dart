import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/routes_constant.dart';
import '../../constants/theme_constant.dart';
import 'components/app_bar.dart';
import 'components/conversation.dart';
import 'components/horizontal_list.dart';

class Conversations extends StatefulWidget {
  const Conversations({Key? key}) : super(key: key);

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  void handleOpenChatDetail() {
    Get.toNamed(Routes.chatDetail);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(
                  'assets/images/avatar.jpg',
                ),
              ),
            ),
            SizedBox(width: kDefaultPadding),
            Text('Chats'),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
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
