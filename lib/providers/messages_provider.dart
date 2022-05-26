import 'package:flutter/material.dart';
import 'package:lab6/models/message_model.dart';

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
}
