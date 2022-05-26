import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/providers/socket_provider.dart';
import 'package:provider/provider.dart';

import '../../models/conversation_model.dart';
import '../../models/message_model.dart';
import '../../providers/auth_provider.dart';
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

  UserDetailModel? receiver = Get.arguments["receiver"];
  ConversationModel? conversation = Get.arguments["conversation"];
  final ScrollController _scrollController = ScrollController();

  void handleChangeTheme(String newValue) {
    setState(() => theme = newValue);
  }

  void handleChangeConversation(ConversationModel newValue) {
    setState(() => conversation = newValue);
    joinRoom(newValue.id);
    listenMessage();
  }

  void listenMessage() {
    context.read<SocketProvider>().socket.on("new-message", (data) {
      MessageModel message =
          MessageModel("Oke", data["sender"], data["content"], true);
      if (mounted) {
        context.read<MessageProvider>().newMessage(message);
      }
    });
  }

  void joinRoom(String conversationId) {
    context.read<SocketProvider>().socket.emit("join-room", {
      "room": conversationId,
    });
  }

  void leaveRoom() {
    context.read<SocketProvider>().socket.emit("leave-room", {
      "room": conversation!.id,
    });
  }

  @override
  void initState() {
    super.initState();
    if (conversation != null) {
      joinRoom(conversation!.id);
      listenMessage();
    }
  }

  @override
  Widget build(BuildContext context) {
    late UserDetailModel _receiver;

    if (receiver == null && conversation != null) {
      if (conversation!.users.length == 2) {
        if (conversation!.users[0].username ==
            context.read<Auth>().user!.username) {
          _receiver = conversation!.users[1];
        } else {
          _receiver = conversation!.users[0];
        }
      }
    } else {
      _receiver = receiver!;
    }

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
          if (conversation != null) {
            context.read<MessageProvider>().setMessages([]);
            leaveRoom();
          }
          return true;
        },
        child: Scaffold(
          appBar: ChatDetailAppBar(
            handleChangeTheme: handleChangeTheme,
            conversation: conversation,
            receiver: _receiver,
          ),
          body: Column(
            children: [
              MessageDisplay(conversation: conversation),
              InputField(
                scrollController: _scrollController,
                conversation: conversation,
                receiver: _receiver,
                handleChangeConversation: handleChangeConversation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
