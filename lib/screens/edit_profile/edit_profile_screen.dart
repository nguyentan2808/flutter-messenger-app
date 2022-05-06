import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab6/components/facebook_button.dart';
import 'package:lab6/models/user_model.dart';

import '../../constants/theme_constant.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  final UserModel user = Get.arguments;

  void _confirmGoBack() => Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultRadius / 2),
          ),
          title: Text("dialog_title_go_back".tr),
          content: Text("dialog_content_go_back".tr),
          actions: <Widget>[
            TextButton(
              child: Text("dialog_button_go_back".tr),
              onPressed: () => Get.back(),
            ),
            TextButton(
              child: Text('dialog_button_cancel'.tr),
              onPressed: () {
                Get.back();
                Get.back();
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _confirmGoBack();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('profile_edit'.tr),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.35,
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                    child: SvgPicture.asset(
                      'assets/images/edit_profile_svg.svg',
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                EditRow(
                  name: "profile_name".tr,
                  defaultValue: user.name,
                  type: TextInputType.text,
                ),
                EditRow(
                  name: "profile_email".tr,
                  defaultValue: user.email,
                  type: TextInputType.emailAddress,
                ),
                EditRow(
                  name: "profile_phone".tr,
                  defaultValue: user.phone,
                  type: TextInputType.number,
                ),
                EditRow(
                  name: "profile_status".tr,
                  defaultValue: user.status ?? "",
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FaceBookButton(
                      text: "profile_cancel".tr,
                      icon: Icons.cancel,
                      isActive: false,
                      onPressed: _confirmGoBack,
                    ),
                    const SizedBox(
                      width: kDefaultPadding / 2,
                    ),
                    FaceBookButton(
                      text: "profile_save".tr,
                      icon: Icons.save,
                      isActive: true,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditRow extends StatelessWidget {
  const EditRow(
      {Key? key,
      required this.name,
      required this.defaultValue,
      required this.type})
      : super(key: key);

  final String name;
  final String defaultValue;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.2)
                    : Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(32),
              ),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: type,
                initialValue: defaultValue,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
