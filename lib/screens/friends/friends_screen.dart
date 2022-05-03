import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

import '../../constant.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                  backgroundImage: AssetImage(
                    'assets/images/avatar.jpg',
                  ),
                ),
              ),
              SizedBox(width: kDefaultPadding),
              Text('Friends'),
            ],
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicator: MD2Indicator(
              indicatorHeight: 5,
              indicatorColor: Get.isDarkMode
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              indicatorSize: MD2IndicatorSize.normal,
            ),
            tabs: const [
              Tab(text: "Online Users"),
              Tab(text: "Friend"),
              Tab(text: "All people"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
