import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/user_model.dart';

class ProfileStatus extends StatelessWidget {
  ProfileStatus({Key? key}) : super(key: key);
  static const String routeName = "/profile_status";

  final UserModel _userModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/account_status.png",
                  height: 400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Dear ${_userModel.firstName}!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Your Account is not Active Kindly contact to our Adminitrator to Activate your account\n"
                  "Contact: +923147779570",
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }
}
