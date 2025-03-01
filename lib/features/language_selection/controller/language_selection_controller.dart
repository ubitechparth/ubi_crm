import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/core/globals.dart';
import 'package:ubi_crm/core/language_contant/localization_service.dart';
import 'package:ubi_crm/core/model/language_selection/language_selection.dart';
import 'package:ubi_crm/core/routes/route_constant.dart';
import 'package:ubi_crm/theme/color_constant.dart';

class LanguageSelectionController extends GetxController {
  LanguageSelectionController();

  Rx<Color?> bgColor = AppColor.primaryOriginalColor.obs;

  RxInt selectedIndex = 0.obs;
  final GlobalKey otherNavigatorKey = GlobalKey<FormState>();
  int lanIndex = 0;
  LocalizationService localizationService = LocalizationService();

  var languageCardList = [
    LanguageSelectionCardModel(
        locale: 'en',
        councode: 'US',
        languageTitle: "English",
        background: AppColor.primaryOriginalColor,
        illustration: AppAssets.illustration.english,
        isSelected: false),
    LanguageSelectionCardModel(
        locale: 'es',
        councode: 'ES',
        languageTitle: "Spanish",
        background: AppColor.primaryOriginalColor,
        illustration: AppAssets.illustration.spanish,
        isSelected: false),
    LanguageSelectionCardModel(
        locale: 'hi',
        councode: 'HI',
        languageTitle: "Hindi",
        background: AppColor.primaryOriginalColor,
        illustration: AppAssets.illustration.hindi,
        isSelected: false),
    LanguageSelectionCardModel(
        locale: 'ar',
        councode: 'AR',
        languageTitle: "Arabic",
        background: AppColor.primaryOriginalColor,
        illustration: AppAssets.illustration.arabic,
        isSelected: false),
    LanguageSelectionCardModel(
        locale: 'vi',
        councode: 'VI',
        languageTitle: "Vietnamese",
        background: AppColor.primaryOriginalColor,
        illustration: AppAssets.illustration.vietnamese,
        isSelected: false),
  ];

  @override
  void onInit() async {
    lanIndex = appPrefs.languageIndexValue;
    languageIndex.value = lanIndex;
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        selectedIndex.value = appPrefs.languageIndexValue;
        bgColor.value =
            languageCardList[appPrefs.languageIndexValue].background;
      },
    );
    super.onInit();
  }

  void selectLanguage(index) async {
    selectedIndex.value = index;
    appPrefs.languageIndexValue = index;
    bgColor.value = languageCardList[index].background;
    LocalizationService().changeLocale(languageCardList[index].languageTitle);
  }

  void moveToNextScreen() async {
    Get.offAllNamed(RouteConstant.login);
  }
}
