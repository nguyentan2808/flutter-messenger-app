import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/models/user_model.dart';

import '../../../constants/theme_constant.dart';
import '../profile_screen.dart';

class ProfileFriends extends StatefulWidget {
  const ProfileFriends({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  State<ProfileFriends> createState() => ProfileFriendsState();
}

class ProfileFriendsState extends State<ProfileFriends> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();

    String mockJson =
        '[{"username":"Kallie_Prosacco","name":"Ressie","email":"Lamont71@hotmail.com","phone":"824.716.6245 x9494","avatar":"https://logowik.com/content/uploads/images/flutter5786.jpg","coverPhoto":"http://loremflickr.com/640/480/nature","status":"Maiores accusamus voluptatem repellat repellendus.","id":"1"},{"username":"Ezequiel_Stark","name":"Jayce","email":"Celestine.Hodkiewicz@hotmail.com","phone":"1-869-989-3505 x271","avatar":"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/2300px-React-icon.svg.png","coverPhoto":"http://loremflickr.com/640/480/nature","status":"Quas corporis exercitationem ut eos ex soluta.","id":"2"},{"username":"Ford_Rath","name":"Turner","email":"Etha_Hegmann@hotmail.com","phone":"1-473-345-7722","avatar":"https://cdn.pixabay.com/photo/2015/04/23/17/41/javascript-736400_960_720.png","coverPhoto":"http://loremflickr.com/640/480/nature","status":"Itaque facere quo veniam error consequuntur.","id":"3"},{"username":"Monique.Feil","name":"Maryam","email":"Thad11@gmail.com","phone":"855.207.3083","avatar":"https://tuyendung.hachinet.com/client/images/language/Java.png","coverPhoto":"http://loremflickr.com/640/480/nature","status":"Accusantium et hic magni accusantium.","id":"4"},{"username":"Karolann94","name":"Larissa","email":"Casandra_Waelchi@gmail.com","phone":"1-861-614-7500","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/670.jpg","coverPhoto":"http://loremflickr.com/640/480/nature","status":"Exercitationem dolorum odio animi placeat.","id":"5"},{"username":"Barney.Reilly14","name":"Saul","email":"Chanelle_Lehner22@hotmail.com","phone":"(881) 709-4608","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/471.jpg","coverPhoto":"http://loremflickr.com/640/480/nature","status":"Omnis aut odio quibusdam eos et.","id":"6"}]';
    List decode = jsonDecode(mockJson);

    List<UserModel> users = decode.map((e) => UserModel.fromJson(e)).toList();
    setState(() {
      this.users = users;
    });
  }

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
                    style: TextStyle(fontSize: 14),
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
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: kDefaultPadding / 2 + 2,
            mainAxisSpacing: kDefaultPadding / 2 + 2,
            crossAxisCount: 3,
            childAspectRatio: (0.9),
          ),
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            UserModel currentUser = users[index];
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => const ProfileScreen(),
                  arguments: currentUser,
                  transition: Transition.rightToLeftWithFade,
                  preventDuplicates: false,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: currentUser.avatar as String,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Text(currentUser.name),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
