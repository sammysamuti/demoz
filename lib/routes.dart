import 'package:demoz/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    SplashScreen.route: (context) => SplashScreen(),
  };
}
