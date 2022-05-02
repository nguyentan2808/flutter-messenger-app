import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab6/constant.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign Up',
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            width: double.infinity,
            child: Column(
              children: [
                const Text(
                  'Sign Up - Profile',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: kDefaultPadding / 2),
                SizedBox(
                  width: Get.width * 0.6,
                  child: const Text(
                    "Complete your profile to get started with modern chat app.",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: kDefaultPadding * 2.5),
                buildNameTextField(context),
                const SizedBox(height: kDefaultPadding * 1.5),
                buildEmailTextField(context),
                const SizedBox(height: kDefaultPadding * 1.5),
                buildPhoneTextField(context),
                const SizedBox(height: kDefaultPadding * 1.5),
                const BirthDayTextField(),
                const SizedBox(height: kDefaultPadding * 1.5),
                const PasswordTextField(),
                const SizedBox(height: kDefaultPadding * 1.5),
                const ConfirmPasswordTextField(),
                const SizedBox(height: kDefaultPadding * 1.5),
                buildSignUpButton(context),
                const SizedBox(height: kDefaultPadding * 2.5),
                Opacity(
                  opacity: 0.6,
                  child: SizedBox(
                    width: Get.width * 0.8,
                    child: const Text(
                      "By continuing, you agree to our Terms of Service and Privacy Policy",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  MaterialButton buildSignUpButton(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(kDefaultPadding),
      elevation: 0,
      color: Theme.of(context).primaryColor,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.app_registration_rounded,
            size: 20,
            color: Colors.white,
          ),
          Row(
            children: const [
              SizedBox(width: kDefaultPadding / 2),
              Text(
                "Sign up",
                style: TextStyle(
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

  TextField buildNameTextField(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.person, color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: "Ex: John Doe",
      ),
    );
  }

  TextField buildEmailTextField(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.email, color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
        contentPadding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: "Ex: john@doe.com",
      ),
    );
  }

  TextField buildPhoneTextField(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Phone',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.phone, color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: "Ex: +84 987 654 321",
      ),
    );
  }
}

class BirthDayTextField extends StatefulWidget {
  const BirthDayTextField({Key? key}) : super(key: key);

  @override
  State<BirthDayTextField> createState() => _BirthDayTextFieldState();
}

class _BirthDayTextFieldState extends State<BirthDayTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1800),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

          setState(() => controller.text = formattedDate);
        }
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: 'Birthday',
        prefixIcon:
            Icon(Icons.date_range, color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: "Ex: 2020-01-01",
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      obscureText: !isShowPassword,
      decoration: InputDecoration(
        labelText: 'Password',
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

class ConfirmPasswordTextField extends StatefulWidget {
  const ConfirmPasswordTextField({Key? key}) : super(key: key);

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      obscureText: !isShowPassword,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon:
            Icon(Icons.confirmation_num, color: Theme.of(context).primaryColor),
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
