import 'package:get/get.dart';
import 'package:inkuna/inkuna_app/Auth/Screens/register_user_screen.dart';
import '../Auth/Screens/login_screen.dart';
import '../Auth/auth_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: LoginScreen.routeName,
      page: () => LoginScreen(),
      binding: AuthBinding(),
      preventDuplicates: true,
    ),
    GetPage(
      name: RegistrationScreen.routeName,
      page: () => RegistrationScreen(),
      binding: AuthBinding(),
      preventDuplicates: true,
    ),
  ];
}
