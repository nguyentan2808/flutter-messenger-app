import 'package:flutter/material.dart';
import 'package:lab6/models/conversation_model.dart';

class ConversationsProvider with ChangeNotifier {
  List<ConversationModel> _conversations = [];

  get conversations => _conversations;

  void initConversations(List<ConversationModel> conversations) {
    _conversations = conversations;
    notifyListeners();
  }

  void addConversation(ConversationModel conversation) {
    _conversations.add(conversation);
    notifyListeners();
  }

  void removeConversation(ConversationModel conversation) {
    _conversations.remove(conversation);
    notifyListeners();
  }

  void updateTheme(String conversationId, String theme) {
    int index = _conversations.indexWhere((e) => e.id == conversationId);
    if (index != -1) {
      _conversations[index].theme = theme;
    }
  }
}
