import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:provider/provider.dart';

import '../../../components/loader_dialog.dart';
import '../../../components/notification.dart';
import '../../../constants/theme_constant.dart';
import '../../../models/user_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../services/auth_service.dart';

class ProfileImages extends StatelessWidget {
  const ProfileImages({Key? key, required this.user, required this.isMe})
      : super(key: key);

  final bool isMe;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 3,
      child: Stack(
        children: [
          CoverPhoto(user: user, isMe: isMe),
          Avatar(user: user, isMe: isMe)
        ],
      ),
    );
  }
}

class CoverPhoto extends StatelessWidget {
  const CoverPhoto({Key? key, required this.user, required this.isMe})
      : super(key: key);

  final UserModel user;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    Future handleChangeCoverPhoto(String url) async {
      try {
        await AuthService().updateCoverPhoto(
            context, context.read<Auth>().user!.username, url);
        LoaderDialog.hide();

        NotificationDialog.show(
            context, "Update cover photo", "Cover photo update successfully🚀");
      } catch (error) {
        LoaderDialog.hide();

        NotificationDialog.show(context, "Error", error.toString());
      }
    }

    return GestureDetector(
      onTap: () =>
          isMe ? openPickerImage(context, handleChangeCoverPhoto) : null,
      child: Padding(
        padding: EdgeInsets.only(bottom: Get.width / 12),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: user.coverPhoto != ""
              ? CachedNetworkImage(
                  imageUrl: user.coverPhoto,
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.image_outlined),
                  ),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                )
              : Center(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image_outlined),
                  ),
                ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.user,
    required this.isMe,
  }) : super(key: key);

  final UserModel user;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    Future handleChangeAvatar(String url) async {
      try {
        await AuthService()
            .updateAvatar(context, context.read<Auth>().user!.username, url);
        LoaderDialog.hide();

        NotificationDialog.show(
            context, "Update avatar", "Avatar update successfully🚀");
      } catch (error) {
        LoaderDialog.hide();

        NotificationDialog.show(context, "Error", error.toString());
      }
    }

    return Positioned(
      bottom: 0,
      left: 10,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: user.avatar == "" ? kDefaultAvatarUrl : user.avatar,
            imageBuilder: (context, imageProvider) => Container(
              width: Get.width / 3,
              height: Get.width / 3,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 3.0,
                ),
              ),
            ),
          ),
          isMe
              ? Positioned(
                  bottom: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () {
                      openPickerImage(context, handleChangeAvatar);
                    },
                    child: Container(
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

Future<void> pickImage(
    BuildContext context, ImageSource source, Function callback) async {
  final cloudinary = CloudinaryPublic('nguyentan2808', 'flutter-final');
  final picker = ImagePicker();

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
