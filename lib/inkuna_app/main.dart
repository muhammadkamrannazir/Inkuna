import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Auth/Screens/login_screen.dart';
import 'Auth/auth_binding.dart';
import 'Routes/app_pages.dart';
import 'Utils/color_resources.dart';
import 'Utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Connectivity().onConnectivityChanged.listen(
    (event) {
      log("${event.name}  XX $event");
      if (event == ConnectivityResult.none && !Get.isSnackbarOpen) {
        Get.showSnackbar(const GetSnackBar(
          title: "No Internet",
          message: "Please connect to the internet",
          backgroundColor: Colors.redAccent,
          isDismissible: false,
          snackPosition: SnackPosition.TOP,
        ));
        Get.defaultDialog(
            title: "No Internet",
            barrierDismissible: false,
            titleStyle: const TextStyle(
                fontWeight: FontWeight.w900, color: Colors.redAccent),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            content: const Text(
                "Checking the network cables, modem, and router\n or try to reconnecting to Wi-Fi"),
            actions: [
              TextButton(
                  onPressed: () async {
                    if (await Connectivity().checkConnectivity() !=
                        ConnectivityResult.none) {
                      Get.back();
                    }
                  },
                  child: const Text("Check Connections"))
            ]);
      } else {
        if (Get.isSnackbarOpen) {
          Get.closeAllSnackbars();
        }
        if (Get.isDialogOpen != null && Get.isDialogOpen!) {
          Get.back();
        }
      }
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: ColorResources.bgColor,
        textTheme: GoogleFonts.prozaLibreTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black, fontSizeFactor: 1.1),
        canvasColor: ColorResources.secondaryColor,
      ),
      debugShowCheckedModeBanner: false,
      onInit: () {
        Get.put(AuthBinding());
      },
      initialBinding: AuthBinding(),
      initialRoute: LoginScreen.routeName,
      getPages: AppPages.routes,
    );
  }
}
