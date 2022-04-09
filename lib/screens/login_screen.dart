// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: size.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SvgPicture.asset(
                'assets/images/login_svg.svg',
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Login Details",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Outfit"),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  alignment: Alignment.topRight,
                  child: const Text(
                    "Forgot Password ?",
                    style: TextStyle(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                        fixedSize: MaterialStateProperty.all(
                            Size(size.width * 0.9, 50))),
                    onPressed: () {},
                    child: const Text("Login")),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or sign in with",
                        style: TextStyle(
                            fontFamily: 'Outfit', fontWeight: FontWeight.w500),
                      ),
                    ),
                    Divider(),
                  ],
                ),
                const SizedBox(height: 16),
                SvgPicture.asset(
                  'assets/images/social_svg.svg',
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.25,
      height: 2,
      decoration: BoxDecoration(
        color: Colors.indigo[500],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
