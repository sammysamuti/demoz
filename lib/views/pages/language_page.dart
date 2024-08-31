import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:demoz/controllers/language_controller.dart';
import 'package:demoz/core/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});
  static String route = 'language-page';

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80.h),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(AppLocalizations.of(context)!.language ?? 'Language'),
        ),
      ),
      body: GetBuilder<LanguageController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              GestureDetector(
                child: ListTile(
                  splashColor: Colors.transparent,
                  onTap: () {
                    controller.changeLanguage('am');
                  },
                  title: Text(
                    'አማርኛ',
                    style: TextStyle(
                      fontWeight: controller.selectedLanguageIndex == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 16.sp,
                    ),
                  ),
                  subtitle: const Text("Amharic"),
                  trailing: Radio<int>(
                    fillColor: MaterialStateProperty.resolveWith(
                      (states) => AppConstants.accentColor,
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    value: 1,
                    groupValue: controller.selectedLanguageIndex,
                    onChanged: (value) {
                      controller.changeLanguage('am');
                    },
                  ),
                ),
              ),
              const Divider(),
              GestureDetector(
                child: ListTile(
                  splashColor: Colors.transparent,
                  onTap: () {
                    controller.changeLanguage('en');
                  },
                  title: Text(
                    'English',
                    style: TextStyle(
                      fontWeight: controller.selectedLanguageIndex == 2
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 16.sp,
                    ),
                  ),
                  subtitle: const Text("English"),
                  trailing: Radio<int>(
                    fillColor: MaterialStateProperty.resolveWith(
                      (states) => AppConstants.accentColor,
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    value: 2,
                    groupValue: controller.selectedLanguageIndex,
                    onChanged: (value) {
                      controller.changeLanguage('en');
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
