import 'package:flutter/material.dart';
import 'package:lab6/constant.dart';

import '../setting/setting_screen.dart';
import '../conversations/conversations.dart';
import 'components/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<Widget> tabs = [
    Conversations(),
    const S2(),
    const SettingScreen()
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void handleChangeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
            ),
            SizedBox(width: kDefaultPadding),
            Text('Chats'),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SafeArea(child: widget.tabs[selectedIndex]),
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
