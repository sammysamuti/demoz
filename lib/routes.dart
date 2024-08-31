import 'package:demoz/views/auth/login_page.dart';
import 'package:demoz/views/auth/register_page.dart';
import 'package:demoz/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    SplashScreen.route: (context) => SplashScreen(),
    LoginPage.route: (context) => LoginPage(),
    RegisterCompanyPage.route: (context) => RegisterCompanyPage(),
  };
}
