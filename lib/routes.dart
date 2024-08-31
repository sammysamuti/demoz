import 'package:demoz/views/auth/login_page.dart';
import 'package:demoz/views/auth/register_page.dart';
import 'package:demoz/views/pages/payroll_manage_page.dart';
import 'package:demoz/views/pages/profile_page.dart';
import 'package:demoz/views/pages/settings_page.dart';
import 'package:demoz/views/screens/main_screen.dart';
import 'package:demoz/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:demoz/views/pages/language_page.dart';
Map<String, WidgetBuilder> getRoutes() {
  return {
    SplashScreen.route: (context) => SplashScreen(),
    LoginPage.route: (context) => LoginPage(),
    RegisterCompanyPage.route: (context) => RegisterCompanyPage(),
    MainScreen.route: (context) => MainScreen(),
    ManagementPage.route: (context) => ManagementPage(),
    ProfilePage.route: (context) => ProfilePage(),
    LanguagePage.route: (context) => LanguagePage(),
    SettingsPage.route: (context) => SettingsPage(),
  };
}
