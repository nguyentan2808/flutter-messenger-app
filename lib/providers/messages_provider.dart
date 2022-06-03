import 'package:flutter/material.dart';

import '../models/message_model.dart';

class MessageProvider with ChangeNotifier {
  List<MessageModel> _messages = [];

  get messages => _messages;

  void setMessages(List<MessageModel> messages) {
    _messages = messages;
    notifyListeners();
  }

  void newMessage(MessageModel newMessage) {
    _messages.add(newMessage);

    notifyListeners();
  }

  void reaction(String id, String reaction) {
    for (var message in _messages) {
      if (message.id == id) {
        if (message.reaction == reaction) {
          message.reaction = "";
        } else {
          message.reaction = reaction;
        }
      }
    }
    notifyListeners();
  }
}
