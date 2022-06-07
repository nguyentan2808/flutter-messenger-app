import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/facebook_button.dart';
import '../../components/loader_dialog.dart';
import '../../components/notification.dart';
import '../../constants/theme_constant.dart';
import '../../models/user_model.dart';
import '../../services/auth_service.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UserModel user = Get.arguments;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _statusController.dispose();
  }

  @override
  void initState() {
    super.initState();

    _nameController.text = user.name;
    _emailController.text = user.email;
    _phoneController.text = user.phone;
    _statusController.text = user.status;
  }

  Future onSubmit() async {
    if (_formKey.currentState!.validate()) {
      String username = user.username;
      String name = _nameController.text;
      String email = _emailController.text;
      String phone = _phoneController.text;
      String status = _statusController.text;

      try {
        LoaderDialog.show(context, "Updating profile...");
        await AuthService()
            .updateProfile(context, username, name, email, phone, status);
        LoaderDialog.hide();
        Get.back();
        NotificationDialog.show(
            context, "Update profile", "Update profile Success");
      } catch (e) {
        LoaderDialog.hide();
        NotificationDialog.show(context, "Error", e.toString());
      }
    }
  }

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
            child: Form(
              key: _formKey,
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
                    type: TextInputType.text,
                    disable: false,
                    controller: _nameController,
                  ),
                  EditRow(
                    name: "profile_email".tr,
                    type: TextInputType.emailAddress,
                    disable: user.isLocal ? false : true,
                    controller: _emailController,
                  ),
                  EditRow(
                    name: "profile_phone".tr,
                    type: TextInputType.number,
                    disable: false,
                    controller: _phoneController,
                  ),
                  EditRow(
                    name: "profile_status".tr,
                    type: TextInputType.text,
                    disable: false,
                    controller: _statusController,
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
                        onPressed: onSubmit,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

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
}

class EditRow extends StatelessWidget {
  const EditRow({
    Key? key,
    required this.name,
    required this.type,
    required this.disable,
    required this.controller,
  }) : super(key: key);

  final String name;
  final TextInputType type;
  final bool disable;
  final TextEditingController controller;

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this field';
    }

    return null;
  }

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
            child: TextFormField(
              validator: validator,
              enabled: !disable,
              controller: controller,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5,
                    vertical: kDefaultPadding),
                hintStyle: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
