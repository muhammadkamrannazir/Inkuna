import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/user_model.dart';
import '../Utils/constants.dart';
import '../Utils/helpers.dart';
import 'Screens/profile_status.dart';
import 'auth_service.dart';

class AuthController extends GetxController {
  bool isLoading = false;

  bool isInitializing = false;
  final authService = Get.find<AuthService>();

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (getUserFromStorage() != null) {
        // Get.offAllNamed(CategoryScreen.routeName);
        UserModel userModel = getUserFromStorage()!;
        if (userModel.isActive == enableStatus) {
          // Get.offAllNamed(DashboardScreen.routeName);
          Helper.showMyToast("Navigate to Dashboard");
        } else {
          Get.offAllNamed(ProfileStatus.routeName, arguments: userModel);
        }
      }
    });

    super.onInit();
  }
}
