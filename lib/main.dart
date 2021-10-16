import 'package:flutter/material.dart';
import 'package:food_ninja/core/application/bootstrap/bootstrap.dart';
import 'package:food_ninja/state/bootstrap/state_bootstrap.dart';
import 'package:food_ninja/state/routes/routes.dart';
import 'package:food_ninja/ui/bootstrap/ui_bootstrap.dart';
import 'package:food_ninja/ui/styles/default/theme.dart';
import 'package:food_ninja/ui/widgets/pages/auth/login_page.dart';
import 'package:food_ninja/ui/widgets/pages/auth/ready_profile_status_page.dart';
import 'package:food_ninja/ui/widgets/pages/auth/registration_page.dart';
import 'package:food_ninja/ui/widgets/pages/main_page/main_page.dart';
import 'package:food_ninja/ui/widgets/pages/onboarding_page/onboarding_delivery_page.dart';
import 'package:food_ninja/ui/widgets/pages/onboarding_page/onboarding_find_food_page.dart';
import 'package:food_ninja/ui/widgets/pages/splash_screen_page/splash_screen_page.dart';
import 'package:food_ninja/ui/widgets/service/app/app_global_keys.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bootstrap.appInit();
  StateBootstrap.appInit();
  UiBootstrap.appInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: primaryThemeData,
      navigatorKey: AppGlobalKeys.rootNavigatorKey,

      // initialRoute: Routes.splashScreen,
      // initialRoute: Routes.login,
      // initialRoute: Routes.registration,
      initialRoute: Routes.readyProfileStatus,
      routes: {
        Routes.main: (_) => const MainPage(),
        Routes.splashScreen: (_) => const SplashScreenPage(),
        Routes.onboarding: (_) => const OnboardingFindFoodPage(),
        // Routes.onboarding: (_) => const OnboardingDeliveryPage(),
        Routes.login: (_) => const LoginPage(),
        Routes.registration: (_) => const RegistrationPage(),
        Routes.readyProfileStatus: (_) => const ReadyProfileStatusPage(),
      },
    );
  }
}