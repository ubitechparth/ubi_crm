import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:ubi_crm/core/globals.dart';
import 'package:ubi_crm/features/language_selection/controller/language_selection_controller.dart';

class DashboardController extends GetxController {
  PersistentTabController persistentTabController = PersistentTabController(initialIndex: initialIndex.value);
  //
  // MyAddonsController? _addonsCard;
  // SettingsController? _settingsController;
  @override
  void onInit() async {
    animatedIcon.value=0;
    Get.find<LanguageSelectionController>();
    super.onInit();
  }



  void callSettingController() async {
  //  _settingsController?.updateListValues();
  }

  void callReportController() async {
    // _newReportsController?.updateListValues();
  }

  void callAddonController() async {
   // _addonsCard?.getAddonsValue();
  }


  void callAttnLogs() async {
    persistentTabController.jumpToTab(3);
  }

}
