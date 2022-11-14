import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkuna/utils/app_colors.dart';
import 'package:inkuna/utils/app_images.dart';
import 'package:inkuna/views/choose_role_controller.dart';
import 'package:inkuna/views/pages/Auth/register.dart';
import 'package:inkuna/views/pages/Teacher/dashboard.dart';
import 'package:inkuna/views/widgets/Custom_Button.dart';
import 'package:inkuna/views/widgets/Custom_Button2.dart';
import 'package:inkuna/views/widgets/my_text.dart';
import 'package:inkuna/views/widgets/my_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // ignore: avoid_unnecessary_containers
      child: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       blue_color,
        //       Colors.lightBlue,
        //     ],
        //   ),
        // ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                buildPageTitle(),
                SizedBox(height: 33.h),
                emailField(),
                SizedBox(height: 24.h),
                passwordField(),
                SizedBox(height: 60.h),
                pageDescription(),
                SizedBox(height: 40.h),
                loginButtons(),
                const Expanded(child: SizedBox(height: 20)),
                goToRegister(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildPageTitle() {
    return Column(
      children: [
        Image(
          height: 25.h,
          width: 25.w,
          color: MyColor.primary,
          image: AssetImage(Assets.person),
        ),
        SizedBox(height: 15.h),
        Obx(
          () => MyText(
            text: roleController.currentRoleStatus.value == RoleStatus.TEACHER
                ? 'Teacher'
                : roleController.currentRoleStatus.value == RoleStatus.PARENTS
                    ? ' Parents'
                    : 'Student',
            color: Colors.black,
          ),
        ),
        SizedBox(height: 25.h),
        MyText(
          text: 'Log in',
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }

  emailField() {
    return Column(
      children: [
        Row(
          children: [
            MyText(
              text: 'Email',
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(height: 5.h),
        MyTextField(
          hintText: 'ej: docente@gmail.com',
          prefixIcon: (Icons.email),
        ),
      ],
    );
  }

  passwordField() {
    return Column(
      children: [
        Row(
          children: [
            MyText(
              text: 'Password',
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(height: 5.h),
        MyTextField(
          hintText: 'xxxxxxxxx',
          prefixIcon: (Icons.lock),
        ),
      ],
    );
  }

  pageDescription() {
    return MyText(
      text:
          'By entering you are accepting our tems and conditions and privacy policy',
    );
  }

  loginButtons() {
    return Column(
      children: [
        MyButton(
          name: 'Log in',
          onPressed: () {
            Get.to(const RegisterPage());
          },
        ),
        const SizedBox(height: 15),
        const MyButton2(name: 'Continue with Google'),
      ],
    );
  }

  goToRegister() {
    return Column(
      children: [
        MyText(
          text: "Don't have an account yet?",
          fontSize: 18,
          color: Colors.black,
        ),
        GestureDetector(
          onTap: () {
            Get.to(const RegisterPage());
          },
          child: MyText(
            text: "Create an account",
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  final roleController = Get.put(ChooseRoleController());
}
