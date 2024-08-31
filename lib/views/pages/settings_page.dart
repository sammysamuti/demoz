import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
static String route = 'setting-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.white,
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            title: const Text('Language'),
            subtitle: const Text('Change app language'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.toNamed('language-page');
            },
          ),
        ],
      ),
    );
  }
}
