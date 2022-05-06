import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) handleChangeIndex;

  const BottomNavigation(
      {Key? key, required this.selectedIndex, required this.handleChangeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 12,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: selectedIndex,
      onTap: handleChangeIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'bottom_home'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.people_alt),
          label: 'bottom_friends'.tr,
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.collections),
        //   label: 'Story',
        // ),
        BottomNavigationBarItem(
          icon: const CircleAvatar(
            radius: 13,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
          label: 'bottom_settings'.tr,
        ),
      ],
    );
  }
}
