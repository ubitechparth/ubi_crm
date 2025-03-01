
import 'package:get/get.dart';
import 'package:ubi_crm/core/globals.dart';
import 'package:ubi_crm/core/language_contant/localization_service.dart';
import 'package:ubi_crm/core/routes/route_constant.dart';
import 'package:ubi_crm/features/language_selection/controller/language_selection_controller.dart';

class SplashScreenController extends GetxController {
  LocalizationService localizationService = LocalizationService();
  LanguageSelectionController languageSelectionController = LanguageSelectionController();

  RxString orgId = ''.obs;
  RxString userId = ''.obs;


  @override
  void onInit() async {
    super.onInit();
    localizationService.changeLocale(languageSelectionController.languageCardList[appPrefs.languageIndexValue].languageTitle);
    languageSelectionController.bgColor.value = languageSelectionController.languageCardList[appPrefs.languageIndexValue].background;
  }

  @override
  void onReady() async {
    Get.offAllNamed(RouteConstant.languageSelectionPage);
    super.onReady();
  }


}