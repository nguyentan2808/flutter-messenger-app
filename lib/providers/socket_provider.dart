import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketProvider with ChangeNotifier {
  late Socket socket;

  void initSocket(String username) {
    socket = io('http://192.168.1.5:5000', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.connect();

    socket.onConnect((_) {
      print('connected');
    });

    socket.onDisconnect((_) => print('disconnect'));
  }

  void disconnect() {
    socket.dispose();
  }
}