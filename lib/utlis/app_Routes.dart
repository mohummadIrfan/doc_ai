import 'package:doctor_ai/view/on_boarding_screen/create_account.dart';
import 'package:doctor_ai/view/on_boarding_screen/loginPage.dart';
import 'package:doctor_ai/view/splashscreen.dart/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String home = '/home';
  static const String symptomTracking = '/symptom-tracking';
  static const String login = '/login';
  static const String signup = '/signup';

  static final routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: signup, page: () => const CreateAccountScreen()),

    GetPage(name: login, page: () => const LoginScreen()),
  ];
}
