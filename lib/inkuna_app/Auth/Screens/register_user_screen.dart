import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_text_field.dart';
import '../Widgets/text_widget.dart';
import '../auth_controller.dart';
import '../auth_service.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = "/registeration";
  final _formKey = GlobalKey<FormState>();

  final authController = Get.find<AuthController>();
  final authService = Get.find<AuthService>();
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      isInitialized = true;
    }
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (_) {
        return Center(
          child: authController.isInitializing
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 150,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text("Registration",
                                  style: GoogleFonts.roboto(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          textBoxWidget(),
                          authController.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : SizedBox(
                                  width: 400,
                                  child: CustomButton(
                                    btnTxt: "Login",
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        // authController.isLoading = true;
                                        authController.update();
                                        await authService.registration(context,
                                            email: emailCtrl.text,
                                            firstName: firstNameCtrl.text,
                                            lastName: lastNameCtrl.text,
                                            password: passwordCtrl.text,
                                            phone: phoneCtrl.text,
                                            userName: userNameCtrl.text);
                                        authController.isLoading = false;
                                        authController.update();
                                      }
                                    },
                                  ),
                                ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      }),
    );
  }

  Widget textBoxWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'START FOR FREE',
          textcolor: Colors.grey,
          textsize: 18,
          fontWeight: FontWeight.normal,
        ),
        // WSizedBox(wval: 0, hval: 0.02),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextWidget(
              text: 'Register your account',
              textcolor: Colors.white,
              textsize: 20,
              fontWeight: FontWeight.bold,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              height: 10,
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          hintText: "First Name",
          isShowBorder: true,
          inputAction: TextInputAction.next,
          inputType: TextInputType.text,
          controller: firstNameCtrl,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          hintText: "Last Name",
          isShowBorder: true,
          inputAction: TextInputAction.next,
          inputType: TextInputType.text,
          controller: lastNameCtrl,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          hintText: "UserName",
          isShowBorder: true,
          inputAction: TextInputAction.next,
          inputType: TextInputType.text,
          controller: userNameCtrl,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          hintText: "Email",
          isShowBorder: true,
          inputAction: TextInputAction.next,
          inputType: TextInputType.emailAddress,
          isEmail: true,
          controller: emailCtrl,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          hintText: "Phone",
          isShowBorder: true,
          inputAction: TextInputAction.next,
          inputType: TextInputType.phone,
          controller: phoneCtrl,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          hintText: "Password",
          isShowBorder: true,
          inputAction: TextInputAction.next,
          inputType: TextInputType.visiblePassword,
          isPassword: true,
          controller: passwordCtrl,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextField(
          hintText: "Confirm Password",
          isShowBorder: true,
          inputAction: TextInputAction.next,
          inputType: TextInputType.visiblePassword,
          isPassword: true,
          controller: confirmPasswordCtrl,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
