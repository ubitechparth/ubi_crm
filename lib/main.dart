import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ubi_crm/core/api_response_box.dart';
import 'package:ubi_crm/core/hive_prefs.dart';
import 'package:ubi_crm/core/language_contant/localization_service.dart';
import 'package:ubi_crm/core/routes/get_pages_constant.dart';
import 'package:ubi_crm/core/routes/route_constant.dart';
import 'package:ubi_crm/core/utils/Internet_network/dependency_injection.dart';
import 'package:ubi_crm/theme/color_constant.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: AppColor.primaryOriginalColor, // navigation bar color
    statusBarColor:AppColor.primaryOriginalColor, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.instance.init();
  // Register Hive adapter
  Hive.registerAdapter(ApiResponseBoxAdapter());
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: MediaQuery.textScaleFactorOf(context).clamp(0.7, 1.1)),
      child: GetMaterialApp(
        title: 'UBI CRM',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColor.primaryVeryLighterColor,
        ),
        locale: LocalizationService.locale,
        textDirection: TextDirection.ltr,
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
        getPages: getPages,
        initialRoute: RouteConstant.splashScreen,
      ),
    );
  }
}

