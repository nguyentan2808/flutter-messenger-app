import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../components/notification.dart';
import '../../constants/theme_constant.dart';
import '../../services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdayController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdayController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future _handleSignUp() async {
      try {
        if (_formKey.currentState!.validate()) {
          final username = _usernameController.text;
          final password = _passwordController.text;
          final name = _nameController.text;
          final email = _emailController.text;
          final phone = _phoneController.text;
          final birthday = _birthdayController.text;

          await AuthService().signUp(
            context,
            username: username,
            password: password,
            name: name,
            email: email,
            phone: phone,
            birthday: birthday,
          );

          NotificationDialog.show(context, "Sign Up", 'Sign up successfully...',
              isPrimary: true, duration: 3000);
        }
      } catch (error) {
        NotificationDialog.show(context, "Error", error.toString());
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'signup_submit'.tr,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Theme.of(context).textTheme.bodyText1?.color,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'signup_title'.tr,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  SizedBox(
                    width: Get.width * 0.6,
                    child: Text(
                      'signup_subtitle'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding * 2.5),
                  UsernameTextField(
                    controller: _usernameController,
                  ),
                  const SizedBox(height: kDefaultPadding * 1.5),
                  PasswordTextField(controller: _passwordController),
                  const SizedBox(height: kDefaultPadding * 1.5),
                  ConfirmPasswordTextField(
                    controller: _confirmPassController,
                    passwordController: _passwordController,
                  ),
                  const SizedBox(height: kDefaultPadding * 1.5),
                  NameTextField(controller: _nameController),
                  const SizedBox(height: kDefaultPadding * 1.5),
                  EmailTextField(controller: _emailController),
                  const SizedBox(height: kDefaultPadding * 1.5),
                  PhoneTextField(controller: _phoneController),
                  const SizedBox(height: kDefaultPadding * 1.5),
                  BirthDayTextField(controller: _birthdayController),
                  const SizedBox(height: kDefaultPadding * 1.5),
                  SignUpButton(onPress: _handleSignUp),
                  const SizedBox(height: kDefaultPadding * 2.5),
                  Opacity(
                    opacity: 0.8,
                    child: SizedBox(
                      width: Get.width * 0.8,
                      child: Text(
                        "signup_terms_confirm".tr,
                        style: const TextStyle(
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
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key, required this.onPress}) : super(key: key);

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
            Icons.app_registration_rounded,
            size: 20,
            color: Colors.white,
          ),
          Row(
            children: [
              const SizedBox(width: kDefaultPadding / 2),
              Text(
                "signup".tr,
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

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    } else if (value.length < 8) {
      return 'Username must be at least 8 characters';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validator,
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "profile_username".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.person, color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: "Ex: johndoe123",
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Name';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validator,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "signup_name".tr,
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
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains("@")) {
      return 'Please enter valid email';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validator,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "signup_email".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.email, color: Theme.of(context).primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
        hintStyle: const TextStyle(fontSize: 14),
        hintText: "Ex: john@doe.com",
      ),
    );
  }
}

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone';
    } else if (value.length < 8) {
      return 'Please enter valid phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validator,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "signup_phone".tr,
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
  const BirthDayTextField({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  State<BirthDayTextField> createState() => _BirthDayTextFieldState();
}

class _BirthDayTextFieldState extends State<BirthDayTextField> {
  @override
  void initState() {
    widget.controller.text = "";
    super.initState();
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Birthday';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validator,
      controller: widget.controller,
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

          setState(() => widget.controller.text = formattedDate);
        }
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: "signup_birthday".tr,
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
  const PasswordTextField({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
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

class ConfirmPasswordTextField extends StatefulWidget {
  const ConfirmPasswordTextField(
      {Key? key, required this.controller, required this.passwordController})
      : super(key: key);

  final TextEditingController passwordController;
  final TextEditingController controller;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (passwordController.text != value) {
      return 'Password does not match';
    }

    return null;
  }

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget._validator,
      textInputAction: TextInputAction.next,
      obscureText: !isShowPassword,
      decoration: InputDecoration(
        labelText: "signup_confirm_password".tr,
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
