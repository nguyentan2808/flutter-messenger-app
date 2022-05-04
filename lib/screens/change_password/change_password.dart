import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/facebook_button.dart';
import '../../constants/theme_constant.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  void _confirmGoBack() => Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultRadius / 2),
          ),
          title: const Text('Go back'),
          content: const Text('Your changes will be lost, are you sure?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Get.back(),
            ),
            TextButton(
              child: const Text('Back'),
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
          title: const Text('Change Password'),
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
                const EditRow(
                  name: 'Password',
                  defaultValue: "123456789",
                ),
                const EditRow(
                  name: 'New password',
                  defaultValue: "123456789",
                ),
                const EditRow(
                  name: 'Confirm password',
                  defaultValue: "123456789",
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FaceBookButton(
                      text: "Cancel",
                      icon: Icons.cancel,
                      isActive: false,
                      onPressed: _confirmGoBack,
                    ),
                    const SizedBox(
                      width: kDefaultPadding / 2,
                    ),
                    FaceBookButton(
                      text: "Save",
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

class EditRow extends StatefulWidget {
  const EditRow({
    Key? key,
    required this.name,
    required this.defaultValue,
  }) : super(key: key);

  final String name;
  final String defaultValue;

  @override
  State<EditRow> createState() => _EditRowState();
}

class _EditRowState extends State<EditRow> {
  bool isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              widget.name,
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
                initialValue: widget.defaultValue,
                obscureText: isHidePassword ? true : false,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  suffixIcon: InkWell(
                    onTap: () =>
                        setState(() => isHidePassword = !isHidePassword),
                    customBorder: const CircleBorder(),
                    child: Icon(
                      isHidePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
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
