import 'package:flutter/material.dart';
import 'package:food_ninja/core/application/bootstrap/bootstrap.dart';
import 'package:food_ninja/state/bootstrap/state_bootstrap.dart';
import 'package:food_ninja/state/routes/routes.dart';
import 'package:food_ninja/ui/bootstrap/ui_bootstrap.dart';
import 'package:food_ninja/ui/widgets/pages/main_page/main_page.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: AppGlobalKeys.rootNavigatorKey,

      initialRoute: Routes.main,
      routes: {
        Routes.main: (_) => const MainPage()
      },
    );
  }
}