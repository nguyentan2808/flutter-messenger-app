import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) handleChangeIndex;

  const BottomNavigation(
      {Key? key, required this.selectedIndex, required this.handleChangeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: selectedIndex,
      onTap: handleChangeIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt),
          label: 'Friends',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.collections),
          label: 'Story',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 13,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
