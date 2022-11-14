import 'package:get/get.dart';

import 'auth_controller.dart';
import 'auth_service.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());

    Get.put(AuthController());
  }
}
