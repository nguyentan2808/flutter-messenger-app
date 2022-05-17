import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../components/facebook_button.dart';
import '../../components/loader_dialog.dart';
import '../../components/notification.dart';
import '../../constants/routes_constant.dart';
import '../../constants/theme_constant.dart';
import '../../providers/auth_provider.dart';
import '../../services/auth_service.dart';
import 'edit_row.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _oldPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
  }

  Future _handleSubmit() async {
    try {
      if (_formKey.currentState!.validate()) {
        if (_newPassController.text != _confirmPassController.text) {
          Get.snackbar(
            "Error",
            "New password and confirm password do not match",
            backgroundColor: Colors.red[400],
            colorText: Colors.white,
            borderRadius: kDefaultRadius / 2,
            animationDuration: const Duration(milliseconds: 400),
          );
        } else {
          LoaderDialog.show(context, "Changing password...");

          String username = context.read<Auth>().user!.username;
          await AuthService().changePassword(context, username,
              _oldPassController.text, _newPassController.text);
          LoaderDialog.hide();

          await AuthService().logOut(context);

          Get.offAllNamed(Routes.login);
          NotificationDialog.show(
            context,
            "Change password",
            "Password changed successfully, please login again ",
            isPrimary: true,
            duration: 3600,
          );
        }
      }
    } catch (e) {
      LoaderDialog.hide();
      NotificationDialog.show(context, "Error", e.toString());
    }
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
              child: Text("dialog_button_cancel".tr),
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
          title: Text("change_password_title".tr),
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
                      'assets/images/change.svg',
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      EditRow(
                        name: "change_password_old_password".tr,
                        controller: _oldPassController,
                      ),
                      EditRow(
                        name: "change_password_new_password".tr,
                        controller: _newPassController,
                      ),
                      EditRow(
                        name: "change_password_confirm_password".tr,
                        controller: _confirmPassController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FaceBookButton(
                      text: "change_password_cancel".tr,
                      icon: Icons.cancel,
                      isActive: false,
                      onPressed: _confirmGoBack,
                    ),
                    const SizedBox(
                      width: kDefaultPadding / 2,
                    ),
                    FaceBookButton(
                      text: "change_password_save".tr,
                      icon: Icons.save,
                      isActive: true,
                      onPressed: _handleSubmit,
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
