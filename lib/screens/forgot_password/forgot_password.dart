import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/theme_constant.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
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
        const Opacity(
          opacity: 0.6,
          child: Text(
            "Remember password? ",
            style: TextStyle(
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
          Get.snackbar("Forgot password",
              "Email sent successfully to ${_controller.text}");
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
        children: const [
          Icon(
            Icons.search,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(width: kDefaultPadding / 2),
          Text(
            "Submit",
            style: TextStyle(
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
        const Text(
          "Forgot Password",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: kDefaultPadding / 2),
        SizedBox(
          width: Get.width * 0.75,
          child: const Text(
            "Enter your email to reset your password, we will send you a link to reset your password",
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
        labelText: 'Phone Number',
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
