import 'package:demoz/views/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_storage/get_storage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static String route = 'setting-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.language),
            subtitle: Text(AppLocalizations.of(context)!.changeapplanguage),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.toNamed('language-page');
            },
          ),
          Divider(),
          ListTile(
            title: Text(AppLocalizations.of(context)!.logout),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              handleSignOut(context);
            },
          ),
        ],
      ),
    );
  }

  void handleSignOut(BuildContext context) {
    final GetStorage storage = GetStorage();
    try {
      storage.remove('loggedIn');
      storage.remove('onboardingCompleted');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully signed out')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: $error')),
      );
    }
  }
}
