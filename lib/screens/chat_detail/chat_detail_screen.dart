import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../api/index.dart';
import '../../models/conversation_model.dart';
import '../../models/message_model.dart';
import '../../providers/messages_provider.dart';
import 'components/app_bar.dart';
import 'components/input_field.dart';
import 'components/message_display.dart';
import 'data/theme_color_list_data.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  String theme = "indigo";

  ConversationModel conversation = Get.arguments;

  final ScrollController _scrollController = ScrollController();

  Future fetchMessages() async {
    var response = await API().fetchAllMessage(conversation.id);
    var messagesJson = response.data['messages'];
    List<MessageModel> messages = [];
    for (int i = 0; i < messagesJson.length; i++) {
      messages.add(MessageModel.fromJson(messagesJson[i]));
    }
    context.read<MessageProvider>().setMessages(messages);
  }

  void handleChangeTheme(String newValue) {
    setState(() => theme = newValue);
  }

  @override
  void initState() {
    super.initState();
    fetchMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: listThemeColor[theme],
        colorScheme: ColorScheme.light(
          primary: listThemeColor[theme] as Color,
          secondary: listThemeColor[theme] as Color,
        ),
      ),
      child: WillPopScope(
        onWillPop: () async {
          context.read<MessageProvider>().setMessages([]);
          return true;
        },
        child: Scaffold(
          appBar: ChatDetailAppBar(
              handleChangeTheme: handleChangeTheme, conversation: conversation),
          body: Column(
            children: [
              const MessageDisplay(),
              InputField(scrollController: _scrollController),
            ],
          ),
        ),
      ),
    );
  }
}
