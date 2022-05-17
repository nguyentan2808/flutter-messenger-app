import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/theme_constant.dart';

class EditRow extends StatefulWidget {
  const EditRow({Key? key, required this.name, required this.controller})
      : super(key: key);

  final String name;
  final TextEditingController controller;

  @override
  State<EditRow> createState() => _EditRowState();
}

class _EditRowState extends State<EditRow> {
  bool isHidePassword = true;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this field';
    } else if (value.length < 8) {
      return 'This field must be at least 8 characters';
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
              widget.name,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: TextFormField(
              controller: widget.controller,
              validator: _validator,
              textInputAction: TextInputAction.next,
              obscureText: isHidePassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: Get.isDarkMode
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.2)
                    : Theme.of(context).primaryColor.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5,
                    vertical: kDefaultPadding),
                hintStyle: const TextStyle(fontSize: 14),
                hintText: "***********",
                suffixIcon: InkWell(
                  onTap: () => setState(() => isHidePassword = !isHidePassword),
                  child: Icon(
                    isHidePassword ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColor,
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
