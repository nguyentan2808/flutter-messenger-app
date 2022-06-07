import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../components/notification.dart';
import '../../constants/routes_constant.dart';
import '../../constants/theme_constant.dart';
import '../../models/conversation_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/conversations_provider.dart';
import '../../services/conversations_service.dart';
import 'components/app_bar.dart';
import 'components/conversation.dart';
import 'components/horizontal_list.dart';

class Conversations extends StatefulWidget {
  const Conversations({Key? key}) : super(key: key);

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  bool isLoading = false;

  // Future fetchConversations() async {
  //   try {
  //     setState(() => isLoading = true);
  //     var response =
  //         await API().fetchAllConversation(context.read<Auth>().user!.username);
  //     var conversationsJson = response.data['conversations'];
  //     List<ConversationModel> temp = [];
  //     for (int i = 0; i < conversationsJson.length; i++) {
  //       temp.add(ConversationModel.fromJson(conversationsJson[i]));
  //     }
  //     setState(() => conversations = temp);
  //     setState(() => isLoading = false);
  //     return response;
  //   } catch (error) {
  //     setState(() => isLoading = false);
  //     NotificationDialog.show(context, "Error", error.toString());
  //   }
  // }

  // void onThemeChanged(String conversationId, String theme) {
  //   int index = conversations.indexWhere((e) => e.id == conversationId);
  //   if (index != -1) {
  //     setState(() => conversations[index].theme = theme);
  //   }
  // }

  Future fetchConversations() async {
    try {
      setState(() => isLoading = true);

      if (mounted) {
        await ConversationsService(context).fetchConversations();
        setState(() => isLoading = false);
      }
    } catch (e) {
      if (mounted) {
        setState(() => isLoading = false);
        NotificationDialog.show(context, "Error", e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();

    fetchConversations();
  }

  @override
  Widget build(BuildContext context) {
    List<ConversationModel> conversations =
        context.watch<ConversationsProvider>().conversations;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
              ),
              child: CachedNetworkImage(
                imageUrl: context.watch<Auth>().user?.avatar == ""
                    ? kDefaultAvatarUrl
                    : context.watch<Auth>().user?.avatar as String,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 18,
                ),
                placeholder: (context, url) => const CircleAvatar(radius: 18),
                errorWidget: (context, url, error) => const CircleAvatar(
                  radius: 18,
                ),
              ),
            ),
            const SizedBox(width: kDefaultPadding),
            Text('conversation_title'.tr),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.searchPeople),
              icon: const Icon(Icons.search))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.group_add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const CustomAppBar(),
          const HorizontalList(),
          Expanded(
            child: isLoading && conversations.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : conversations.isEmpty
                    ? const Center(child: Text("No conversations"))
                    : RefreshIndicator(
                        onRefresh: fetchConversations,
                        child: ListView.builder(
                          itemCount: conversations.length,
                          itemBuilder: (context, index) =>
                              Conversation(conversation: conversations[index]),
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
