import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../friends/friends_screen.dart';
import '../setting/setting_screen.dart';
import '../conversations/conversations_screen.dart';
import 'components/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<Widget> tabs = [
    const Conversations(),
    const FriendsScreen(),
    const SettingScreen()
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void connectToServer() {
    try {
      Socket socket = io('http://10.0.2.2:5000', <String, dynamic>{
        'transports': ['websocket'],
      });

      socket.onConnect((_) {
        print(socket.connected);
        print(socket.id);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    connectToServer();
  }

  void handleChangeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.tabs[selectedIndex],
      bottomNavigationBar: BottomNavigation(
        handleChangeIndex: handleChangeIndex,
        selectedIndex: selectedIndex,
      ),
    );
  }
}

class S1 extends StatelessWidget {
  const S1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Oke');
  }
}

class S2 extends StatelessWidget {
  const S2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Oke 2');
  }
}

class S3 extends StatelessWidget {
  const S3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Oke 3');
  }
}
