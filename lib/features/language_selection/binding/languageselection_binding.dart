import 'package:get/get.dart';
import 'package:ubi_crm/features/language_selection/controller/language_selection_controller.dart';


class LanguageSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageSelectionController>(() => LanguageSelectionController());
  }
}