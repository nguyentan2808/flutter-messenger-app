import 'package:flutter/material.dart';
import 'package:lab6/models/user_model.dart';

import '../../../constant.dart';

class AccountFriends extends StatelessWidget {
  const AccountFriends({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: kDefaultPadding / 3, bottom: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Friends",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "479 friends",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              const Text(
                "View all",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        GridView.count(
          // primary: false,
          shrinkWrap: true,
          crossAxisSpacing: kDefaultPadding / 2 + 2,
          mainAxisSpacing: kDefaultPadding / 2 + 2,
          crossAxisCount: 3,
          childAspectRatio: (0.9),

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'assets/images/avatar2.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const Text("Nguyen Tan"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'assets/images/avatar2.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const Text("Nguyen Tan"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'assets/images/avatar2.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const Text("Nguyen Tan"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'assets/images/avatar2.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const Text("Nguyen Tan"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'assets/images/avatar2.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const Text("Nguyen Tan"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'assets/images/avatar2.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const Text("Nguyen Tan"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
