import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inkuna/inkuna_app/Auth/Screens/register_user_screen.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_text_field.dart';
import '../Widgets/text_widget.dart';
import '../auth_controller.dart';
import '../auth_service.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";
  final _formKey = GlobalKey<FormState>();

  final authController = Get.find<AuthController>();
  final authService = Get.find<AuthService>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                              Text(
                                "Login",
                                style: GoogleFonts.roboto(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Text(
                                "Welcome back to the Clickon.",
                              ),
                            ],
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
                            controller: email,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            hintText: "Password",
                            isShowBorder: true,
                            inputAction: TextInputAction.go,
                            inputType: TextInputType.visiblePassword,
                            isPassword: true,
                            isShowSuffixIcon: true,
                            controller: password,
                            onFieldSubmit: (String s) async {
                              if (_formKey.currentState!.validate()) {
                                authController.isLoading = true;
                                authController.update();
                                await authService.login(
                                    email.text, password.text, context);
                                authController.isLoading = false;
                                authController.update();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: true,
                                      onChanged: (value) {
                                        // Get.toNamed(
                                        //     RegistrationScreen.routeName);
                                      }),
                                  const Text(
                                    "Remember Me",
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(RegistrationScreen());
                                },
                                child: const Text("Forgot password?"),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
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
                                        await authService.login(
                                            email.text, password.text, context);
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

  Widget aa() {
    return Scaffold(
      body: Column(
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
                text: 'Login to your account',
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

          CustomTextField(
            hintText: "Email",
            isShowBorder: true,
            inputAction: TextInputAction.next,
            inputType: TextInputType.text,
            controller: email,
          ),
          // WSizedBox(wval: 0, hval: 0.02),
          CustomTextField(
            hintText: "Password",
            isShowBorder: true,
            inputAction: TextInputAction.next,
            inputType: TextInputType.visiblePassword,
            isPassword: true,
            controller: password,
          ),
          // WSizedBox(wval: 0, hval: 0.04),
          GetBuilder<AuthController>(builder: (_) {
            return authController.isLoading
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
                    btnTxt: "Login",
                    onTap: () {
                      Get.to(RegistrationScreen());
                    },
                  );
          }),
        ],
      ),
    );
  }
}
