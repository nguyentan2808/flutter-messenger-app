import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountDown extends StatefulWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
      duration: const Duration(milliseconds: 90000),
      tween:
          Tween(begin: const Duration(milliseconds: 90000), end: Duration.zero),
      builder: (BuildContext context, Duration value, Widget? child) {
        final minutes = value.inMinutes;
        final seconds = value.inSeconds % 60;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            '$minutes:$seconds',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}

class CountDownResend extends StatelessWidget {
  const CountDownResend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.8,
            child: Text("${"otp_resend_count_down".tr} "),
          ),
          const CountDown()
        ],
      ),
    );
  }
}
