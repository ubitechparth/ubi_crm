import 'package:get/get.dart';
import 'package:ubi_crm/core/language_contant/localization_service.dart';

class SuggestedAddonsController extends GetxController {
  SuggestedAddonsController();
  RxString selected = LocalizationService.langs.first.obs;

  @override
  void onClose() {}
}
