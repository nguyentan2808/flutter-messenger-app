import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/routes_constant.dart';
import '../../constants/theme_constant.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('forgot_title'.tr),
        foregroundColor: Theme.of(context).textTheme.bodyText1?.color,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              buildLogo(),
              const SizedBox(height: kDefaultPadding * 2.5),
              SizedBox(
                width: double.infinity,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildTitle(),
                      const SizedBox(height: kDefaultPadding * 2.5),
                      buildTextField(context),
                      const SizedBox(height: kDefaultPadding * 2.5),
                      buildSubmitButton(context),
                      const SizedBox(height: kDefaultPadding * 2.5),
                      buildGoBack(context)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(
      alignment: Alignment.center,
      child: SvgPicture.asset(
        "assets/images/forgot_password_svg.svg",
        width: Get.width * 0.6,
      ),
    );
  }

  Row buildGoBack(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
          opacity: 0.6,
          child: Text(
            "forgot_back_desc".tr,
            style: const TextStyle(
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () => Get.back(),
          child: Text(
            'Back to Login',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 13,
            ),
          ),
        )
      ],
    );
  }

  MaterialButton buildSubmitButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Get.snackbar("forgot_title".tr,
          //     "Email sent successfully to ${_controller.text}");

          Get.toNamed(Routes.otpForm);
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(kDefaultPadding),
      elevation: 0,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(width: kDefaultPadding / 2),
          Text(
            "forgot_submit".tr,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Column buildTitle() {
    return Column(
      children: [
        Text(
          "forgot_title".tr,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: kDefaultPadding / 2),
        SizedBox(
          width: Get.width * 0.75,
          child: Text(
            "forgot_subtitle".tr,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  TextFormField buildTextField(BuildContext context) {
    String? _validator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your phone number';
      } else if (value.length < 8 || value.length > 15) {
        return 'Please enter a valid phone number';
      }
      return null;
    }

    return TextFormField(
      controller: _controller,
      validator: _validator,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: "forgot_phone_number".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.person, color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: "Ex: john@doe.com",
      ),
    );
  }
}
