import 'package:get/get.dart';
import 'package:ubi_crm/features/language_selection/controller/language_selection_controller.dart';
import 'package:ubi_crm/features/splash_screen/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>LanguageSelectionController());
    Get.put(SplashScreenController());
  }
}
