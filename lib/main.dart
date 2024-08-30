import 'package:demoz/constants.dart';
import 'package:demoz/routes.dart';
import 'package:demoz/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controllers/language_controller.dart';
import 'controllers/currency_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  ErrorWidget.builder = (details) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppConstants.kcPrimary),
            useMaterial3: true,
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: AppConstants.kcBkg,
          ),
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sentiment_very_dissatisfied_sharp,
                      color: AppConstants.kcTextOne, size: 106.sp),
                  SizedBox(height: 20.h),
                  Text(
                    'Sorry!',
                    style: TextStyle(
                      fontSize: 46.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CurrencyController());
    Get.put(LanguageController());

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppConstants.kcPrimary),
            useMaterial3: true,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: AppConstants.kcBkg,
          ),
          locale: Locale(Get.find<LanguageController>().savedLocale),
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: SplashScreen.route,
          routes: getRoutes(),
        );
      },
    );
  }
}
