import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) =>
                  index == 0 ? const AddMorePeople() : const People(),
            ),
          ),
        ],
      ),
    );
  }
}

class People extends StatelessWidget {
  const People({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      width: Get.width / 6,
      child: Column(
        children: const [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage("assets/images/avatar.jpg"),
          ),
          Text(
            "Nguyen Tan",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

class AddMorePeople extends StatelessWidget {
  const AddMorePeople({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 6,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[200],
            child: const Icon(
              Icons.add,
              color: Colors.black87,
            ),
          ),
          Text(
            "conversation_add".tr,
            maxLines: 2,
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
