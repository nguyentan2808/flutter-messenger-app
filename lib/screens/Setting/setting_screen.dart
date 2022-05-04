import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constants/routes_constant.dart';
import 'package:lab6/constants/theme_constant.dart';
import '../../controllers/auth_controller.dart';
import 'data/settings_data.dart';
import 'models/item_model.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
            ),
            SizedBox(width: kDefaultPadding),
            Text('Settings'),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfilePreview(),
            SettingSection(title: "Apps", list: listAppSettings),
            SettingSection(title: "Preference", list: listPreferenceSettings),
            SettingSection(title: "Other", list: listOthersSettings),
          ],
        ),
      ),
    );
  }
}

class ProfilePreview extends StatelessWidget {
  ProfilePreview({Key? key}) : super(key: key);

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.profile),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/avatar.jpg'),
                  radius: Get.width * 1 / 8,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: kDefaultPadding / 2),
            Text(
              _authController.user.value.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

class SettingSection extends StatelessWidget {
  const SettingSection({Key? key, required this.title, required this.list})
      : super(key: key);
  final String title;
  final List<ItemModel> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ),
          ...list.map((item) => SettingRow(item: item)).toList(),
        ],
      ),
    );
  }
}

class SettingRow extends StatelessWidget {
  const SettingRow({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -2),
      leading: Container(
        padding: const EdgeInsets.all(kDefaultPadding / 2 + 1),
        decoration: BoxDecoration(
            color: item.iconColor,
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Icon(
          item.icon,
          color: Colors.white,
          size: 22,
        ),
      ),
      trailing: const Icon(Icons.navigate_next),
      title: Text(item.title),
      subtitle: Text(
        item.subTitle,
        style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1?.color, fontSize: 12),
      ),
      onTap: item.handleClick,
    );
  }
}
