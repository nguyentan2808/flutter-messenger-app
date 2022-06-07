import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../models/user_model.dart';
import 'auth_provider.dart';
import 'messages_provider.dart';

class SocketProvider with ChangeNotifier {
  late Socket socket;
  BuildContext context;

  SocketProvider(this.context);

  void initSocket(String username) {
    socket = io('https://tdt-flutter-server.up.railway.app', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.connect();

    socket.onConnect((_) {
      UserModel? user = context.read<Auth>().user;
      socket.emit("join", {"username": user?.username});
    });

    socket.on(
      "notification",
      (data) {
        FlutterLocalNotificationsPlugin().show(
          2,
          "New Message",
          "${data['name']}: ${data['content']}",
          const NotificationDetails(
            android: AndroidNotificationDetails(
              "channel.id",
              "channel.name",
              channelDescription: "channel.description",
              importance: Importance.max,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      },
    );

    socket.on("new-reaction", (data) {
      context.read<MessageProvider>().reaction(data["id"], data["reaction"]);
    });

    socket.onDisconnect((_) => print('disconnect'));
  }

  void disconnect() {
    socket.dispose();
  }
}
