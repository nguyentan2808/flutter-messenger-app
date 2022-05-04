import 'package:flutter/material.dart';

import '../../constant.dart';
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
          bottom: const TabBar(
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
            tabs: [
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
