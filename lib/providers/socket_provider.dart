import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketProvider with ChangeNotifier {
  late Socket socket;

  void initSocket(String username) {
    socket = io('http://192.168.1.10:5000', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.onConnect((_) {});

    socket.onDisconnect((_) => print('disconnect'));
  }

  void disconnect() {
    socket.dispose();
  }
}
