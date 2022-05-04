import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/theme_constant.dart';
import 'components/friends_tab.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding / 2,
                ),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
              ),
              SizedBox(width: kDefaultPadding),
              Text('Friends'),
            ],
          ),
          bottom: TabBar(
            indicatorPadding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
            indicatorColor:
                Get.isDarkMode ? Theme.of(context).primaryColor : Colors.indigo,
            tabs: const [
              Tab(text: "Friends"),
              Tab(text: "People"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FriendsTab(),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
