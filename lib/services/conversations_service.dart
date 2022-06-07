import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../api/index.dart';
import '../models/conversation_model.dart';
import '../providers/auth_provider.dart';
import '../providers/conversations_provider.dart';

class ConversationsService {
  final BuildContext context;
  final API api = API();

  ConversationsService(this.context);

  Future fetchConversations() async {
    var response =
        await api.fetchAllConversation(context.read<Auth>().user!.username);
    var conversationsJson = response.data['conversations'];
    List<ConversationModel> temp = [];
    for (int i = 0; i < conversationsJson.length; i++) {
      temp.add(ConversationModel.fromJson(conversationsJson[i]));
    }

    temp.sort((a, b) {
      DateTime aDate =
          DateTime.parse(a.lastMessage?.createdAt ?? DateTime.now().toString());
      DateTime bDate =
          DateTime.parse(b.lastMessage?.createdAt ?? DateTime.now().toString());
      return bDate.compareTo(aDate);
    });
    context.read<ConversationsProvider>().initConversations(temp);

    return response;
  }

  Future deleteConversation(String conversationId) async {
    var response = await api.deleteConversation(conversationId);

    context.read<ConversationsProvider>().removeConversation(conversationId);

    return response;
  }
}
