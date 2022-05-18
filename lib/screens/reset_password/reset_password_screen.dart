import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/components/loader_dialog.dart';
import 'package:lab6/components/notification.dart';
import 'package:lab6/constants/theme_constant.dart';
import 'package:lab6/services/auth_service.dart';

import '../../constants/routes_constant.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  final String username = Get.arguments;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  Future _handleSubmit() async {
    try {
      if (_formKey.currentState!.validate()) {
        LoaderDialog.show(context, "Resetting password...");
        await AuthService()
            .resetPassword(context, widget.username, _passController.text);
        LoaderDialog.hide();

        Get.offAllNamed(Routes.login);
        NotificationDialog.show(
            context, "Reset Password", "Password reset successfully");
      }
    } catch (e) {
      LoaderDialog.hide();
      NotificationDialog.show(context, "Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).textTheme.bodyText1?.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Reset password for account: ",
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    widget.username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              PasswordField(controller: _passController),
              const SizedBox(height: kDefaultPadding),
              ConfirmField(
                  passController: _passController,
                  confirmController: _confirmPassController),
              const SizedBox(height: kDefaultPadding),
              SubmitButton(
                onPress: _handleSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<PasswordField> createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool isShowPassword = false;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: _validator,
      textInputAction: TextInputAction.next,
      obscureText: !isShowPassword,
      decoration: InputDecoration(
        labelText: "signup_password".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: "*********",
        suffixIcon: IconButton(
          icon: Icon(
            isShowPassword ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            setState(() {
              isShowPassword = !isShowPassword;
            });
          },
        ),
      ),
    );
  }
}

class ConfirmField extends StatefulWidget {
  const ConfirmField({
    Key? key,
    required this.passController,
    required this.confirmController,
  }) : super(key: key);

  final TextEditingController passController;
  final TextEditingController confirmController;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (passController.text != confirmController.text) {
      return 'Confirm password does not match';
    }
    return null;
  }

  @override
  State<ConfirmField> createState() => ConfirmFieldState();
}

class ConfirmFieldState extends State<ConfirmField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.confirmController,
      validator: widget._validator,
      textInputAction: TextInputAction.next,
      obscureText: !isShowPassword,
      decoration: InputDecoration(
        labelText: "signup_password".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: "*********",
        suffixIcon: IconButton(
          icon: Icon(
            isShowPassword ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            setState(() {
              isShowPassword = !isShowPassword;
            });
          },
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, required this.onPress}) : super(key: key);

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(kDefaultPadding),
      elevation: 0,
      color: Theme.of(context).primaryColor,
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.cloud_done_outlined,
            size: 20,
            color: Colors.white,
          ),
          Row(
            children: [
              const SizedBox(width: kDefaultPadding / 2),
              Text(
                "forgot_submit".tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
