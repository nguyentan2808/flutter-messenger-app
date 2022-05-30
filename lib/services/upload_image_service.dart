import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../components/loader_dialog.dart';
import '../components/notification.dart';
import '../constants/theme_constant.dart';

class UploadImageService {
  final cloudinary = CloudinaryPublic('nguyentan2808', 'flutter-final');
  final picker = ImagePicker();

  Future<void> pickImage(
      BuildContext context, ImageSource source, Function callback) async {
    try {
      final XFile? image = await picker.pickImage(source: source);

      if (image != null) {
        LoaderDialog.show(context, "Uploading...");
        final res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path, folder: 'flutter-final'),
        );

        callback(res.url);
      }
    } catch (error) {
      NotificationDialog.show(context, "Error", "Something went wrong");
    }
  }

  void openPickerImage(BuildContext context, Function callback) {
    Get.bottomSheet(
      Container(
        height: 112,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kDefaultRadius / 2),
            topRight: Radius.circular(kDefaultRadius / 2),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 56,
              child: ListTile(
                onTap: () {
                  Get.back();
                  pickImage(context, ImageSource.gallery, callback);
                },
                leading: const Icon(Icons.image),
                title: const Text("Pick from gallery"),
              ),
            ),
            SizedBox(
              height: 56,
              child: ListTile(
                onTap: () {
                  Get.back();
                  pickImage(context, ImageSource.camera, callback);
                },
                leading: const Icon(Icons.camera),
                title: const Text("Pick from camera"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
