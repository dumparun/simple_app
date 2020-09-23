import 'package:flutter/material.dart';

import 'package:simple/ui/splash/splash.dart';
import 'package:simple/ui/user/dashboard.dart';
import 'package:simple/ui/user/login.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String dashboard = '/dashboard';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    dashboard: (BuildContext context) => DashBoard()
  };
}
