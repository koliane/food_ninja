import 'package:flutter/material.dart';

class AppGlobalKeys {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey currentPageKey = GlobalKey<ScaffoldState>();

  static GlobalKey<ScaffoldState> initCurrentPageKey() {
    return currentPageKey = GlobalKey<ScaffoldState>();
  }
}