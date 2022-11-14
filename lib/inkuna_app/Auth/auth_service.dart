import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkuna/inkuna_app/Utils/helpers.dart';
import '../Models/user_model.dart';
import '../Utils/constants.dart';
import 'Screens/profile_status.dart';

class AuthService extends GetConnect {
  String url = "$baseUrlMy/api/auth/";

  @override
  void onInit() {
    baseUrl = url;
  }

  login(phone, pass, BuildContext context) async {
    Response response =
        await post("login", FormData({"email": phone, "password": pass}));
    log("${response.body}\n${response.statusCode}");
    if (response.statusCode == 200) {
      var data = response.body;
      UserModel userModel =
          UserModel.fromJson(data['response']['data']['user']);
      userModel.accessToken = data['response']['data']['accessToken'];
      saveAndUpdateUserToStorage(userModel);
      if (userModel.isActive == "1") {
        // Get.offAllNamed(DashboardScreen.routeName);
        Helper.showMyToast("Navigate to Dashboard");
        print('Loginddddddddddd');
      } else {
        Get.toNamed(ProfileStatus.routeName, arguments: userModel);
      }
    } else if (response.statusCode == 401) {
      Helper.showMyToast("Enter Valid Credentials");
    } else {
      Helper.showMyToast("Login Error");
    }
  }

  registration(
    BuildContext context, {
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    Response response = await post(
        "register",
        contentType: "application/json",
        // headers: {
        //   "Content-Type": "application/json",
        //   "Accept": "application/json"
        // },
        FormData({
          "username": userName,
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "phone": phone,
          "password": password,
          "confirm_password": password
        }));
    log("${response.body}\n${response.statusCode}");
    if (response.statusCode == 200) {
      var data = response.body;
      UserModel userModel =
          UserModel.fromJson(data['response']['data']['user']);
      userModel.accessToken = data['response']['data']['accessToken'];
      saveAndUpdateUserToStorage(userModel);
      if (userModel.isActive == "1") {
        // Get.offAllNamed(DashboardScreen.routeName);
        Helper.showMyToast("Navigate to Dashboard");
      } else {
        Get.toNamed(ProfileStatus.routeName, arguments: userModel);
      }
    } else if (response.statusCode == 401) {
      Helper.showMyToast("Enter Valid Credentials");
    } else {
      Helper.showMyToast("Restoration Error");
    }
  }
}
