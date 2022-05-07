import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class ChatDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
