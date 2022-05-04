import 'package:get/get.dart';
import 'package:lab6/controllers/auth_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
