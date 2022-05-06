import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme_constant.dart';
import '../../chat_detail/data/theme_color_list_data.dart';
import '../helpers/capitalize_first_letter.dart';

void openChangeThemeDialog(BuildContext context, Function handleChangeTheme) {
  Get.back();
  Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 3),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text("chat_detail_options_customize".tr),
              trailing: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding / 3),
                  child: Icon(Icons.close,
                      size: 18,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.1)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...listThemeColor.entries
                      .map(
                        (entry) => ListTile(
                          onTap: () {
                            handleChangeTheme(entry.key);
                            buildSnackBarChangeColor(entry);
                          },
                          title: Text(capitalize(entry.key)),
                          leading: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: entry.value,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void buildSnackBarChangeColor(item) {
  Get.snackbar(
    "chat_detail_options_snack_bar_title".tr,
    "chat_detail_options_snack_bar_desc"
        .trParams({"color": capitalize(item.key)}),
    backgroundColor: item.value,
    colorText: Colors.white,
    borderColor: item.value,
    borderWidth: 2,
    borderRadius: kDefaultRadius,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.all(kDefaultPadding / 2),
    animationDuration: const Duration(milliseconds: 500),
  );
}
