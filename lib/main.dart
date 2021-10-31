import 'package:flutter/material.dart';
import 'package:food_ninja/core/application/bootstrap/bootstrap.dart';
import 'package:food_ninja/core/domain/entities/auth/service/auth_service.dart';
import 'package:food_ninja/core/domain/entities/option/service/options.dart';
import 'package:food_ninja/state/bootstrap/state_bootstrap.dart';
import 'package:food_ninja/state/routes/routes.dart';
import 'package:food_ninja/ui/bootstrap/ui_bootstrap.dart';
import 'package:food_ninja/ui/styles/default/theme.dart';
import 'package:food_ninja/ui/widgets/pages/auth/forgot_password_page.dart';
import 'package:food_ninja/ui/widgets/pages/auth/login_page.dart';
import 'package:food_ninja/ui/widgets/pages/auth/new_password_page.dart';
import 'package:food_ninja/ui/widgets/pages/auth/password_reset_successful_status_page.dart';
import 'package:food_ninja/ui/widgets/pages/auth/ready_profile_status_page.dart';
import 'package:food_ninja/ui/widgets/pages/auth/registration_page.dart';
import 'package:food_ninja/ui/widgets/pages/auth/verification_code_page.dart';
import 'package:food_ninja/ui/widgets/pages/filter_page/filter_page.dart';
import 'package:food_ninja/ui/widgets/pages/food_detail_page/food_detail_page.dart';
import 'package:food_ninja/ui/widgets/pages/main_page/main_page.dart';
import 'package:food_ninja/ui/widgets/pages/menu_page/menu_page.dart';
import 'package:food_ninja/ui/widgets/pages/onboarding_page/onboarding_delivery_page.dart';
import 'package:food_ninja/ui/widgets/pages/onboarding_page/onboarding_find_food_page.dart';
import 'package:food_ninja/ui/widgets/pages/onboarding_page/onboarding_page.dart';
import 'package:food_ninja/ui/widgets/pages/order_detail_page/order_detail_page.dart';
import 'package:food_ninja/ui/widgets/pages/restaurant_detail_page/restaurant_detail_page.dart';
import 'package:food_ninja/ui/widgets/pages/restaurants_page/restaurants_page.dart';
import 'package:food_ninja/ui/widgets/pages/splash_screen_page/splash_screen_page.dart';
import 'package:food_ninja/ui/service/app/app_global_keys.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.presentError(details);
  //   if (kReleaseMode)
  //     exit(1);
  // };


  runApp(MyApp());
}

//TODO
// class CustomObserver extends NavigatorObserver {
//   @override
//   void didPush(Route route, Route? previousRoute) {
//     // TODO: implement didPush
//     print(route.settings.name);
//     super.didPush(route, previousRoute);
//   }
//
//   @override
//   void didPop(Route route, Route? previousRoute) {
//
//     final context = route.navigator!.context;
//     print('uiiii');
//     print(route.settings.name);
//     print(previousRoute!.settings.name);
//     // ScaffoldMessenger.of(route.navigator!.context).showSnackBar(SnackBar(content: Text('hello')));
//     // TODO: implement didPop
//     super.didPop(route, previousRoute);
//   }
//
//
// }

class MyApp extends StatelessWidget {
  bool isInitialized = false;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    bool isAuthorized = false;

    return MaterialApp(
      // navigatorObservers: [
      //   CustomObserver()
      // ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: primaryThemeData,
      navigatorKey: AppGlobalKeys.rootNavigatorKey,

      // initialRoute: Routes.splashScreen,
      // initialRoute: Routes.login,
      // initialRoute: Routes.registration,
      // initialRoute: Routes.readyProfileStatus,
      // initialRoute: Routes.verificationCode,
      // initialRoute: Routes.forgotPassword,
      // initialRoute: Routes.newPassword,
      // initialRoute: Routes.passwordResetSuccessfulStatus,
      // initialRoute: Routes.main,
      // initialRoute: Routes.restaurants,
      // initialRoute: Routes.menu,
      // initialRoute: Routes.filter,
      // initialRoute: Routes.restaurantDetail,
      // initialRoute: Routes.foodDetail,
      // initialRoute: Routes.orderDetail,
      // initialRoute: Routes.onboarding,
      routes: {
        Routes.main: (_) => const MainPage(),
        Routes.splashScreen: (_) => const SplashScreenPage(),
        // Routes.onboarding: (_) => const OnboardingFindFoodPage(),
        // Routes.onboarding: (_) => const OnboardingDeliveryPage(),
        // Routes.onboarding: (_) => OnboardingPage(),
        Routes.login: (_) => const LoginPage(),
        Routes.registration: (_) => const RegistrationPage(),
        Routes.readyProfileStatus: (_) => const ReadyProfileStatusPage(),
        Routes.verificationCode: (_) => const VerificationCodePage(),
        Routes.forgotPassword: (_) => const ForgotPasswordPage(),
        Routes.newPassword: (_) => NewPasswordPage(),
        Routes.passwordResetSuccessfulStatus: (_) => const PasswordResetSuccessfulStatusPage(),
        Routes.restaurants: (_) => const RestaurantsPage(),
        Routes.menu: (_) => const MenuPage(),
        Routes.filter: (_) => const FilterPage(),
        Routes.restaurantDetail: (_) => const RestaurantDetailPage(),
        Routes.foodDetail: (_) => const FoodDetailPage(),
        Routes.orderDetail: (_) => const OrderDetailPage(),
      },

      home: FutureBuilder(
        future: isInitialized
          ? Future.value()
          : Future.wait([
              Bootstrap.appInit(),
              StateBootstrap.appInit(),
              UiBootstrap.appInit(),
              (() async {
                isAuthorized = await const AuthService().isAuthorized();
              })()
            ]),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreenPage();
          }

          isInitialized = true;

          if(Options().needToShowOnboarding) {
            return OnboardingPage();
          }

          return isAuthorized
              ? const LoginPage()
              : const MainPage()
          ;
          // return TestPage();
        },
      )
    );


  }
}