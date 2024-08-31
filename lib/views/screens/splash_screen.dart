import 'package:flutter/material.dart';
import 'dart:async';
import 'package:demoz/views/screens/onboarding_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:demoz/views/screens/main_screen.dart';
import 'package:demoz/views/auth/login_page.dart';
import 'package:page_transition/page_transition.dart'; 

class SplashScreen extends StatefulWidget {
  static String route = 'splash-screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  void _checkOnboardingStatus() async {
    await Future.delayed(Duration(seconds: 3)); 

    // Checking if onboarding has been completed
    final box = GetStorage();
    bool onboardingCompleted = box.read('onboardingCompleted') ?? false;
    bool loggedIn = box.read('loggedIn') ?? false;

    // Navigating to the appropriate page
    if (onboardingCompleted) {
      if (loggedIn) {
        // If onboarding is completed and user is logged in, navigating to HomePage
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: MainScreen(),
          ),
        );
      } else {
        // If onboarding is completed but user is not logged in, navigating to LoginPage
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: LoginPage(),
          ),
        );
      }
    } else {
      // If onboarding is not completed, navigating to OnboardingPage
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: OnboardingScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onboarding_logo.png',
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
