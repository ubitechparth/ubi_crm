import 'package:get/get.dart';
import 'package:ubi_crm/features/addons_module/myAddons/controller/my_addons_controller.dart';
import 'package:ubi_crm/features/dashboard/controller/dashboard_controller.dart';
import 'package:ubi_crm/features/home_page/presentation/home_page_controller.dart';
import 'package:ubi_crm/features/language_selection/controller/language_selection_controller.dart';
import 'package:ubi_crm/features/lead_module/lead/presentation/controller/lead_controller.dart';
import 'package:ubi_crm/features/reports_module/reports_dashboard/controller/reports_dashboard_controller.dart';
import 'package:ubi_crm/features/setting_module/settings/controller/settings_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<LeadController>(() => LeadController());
    Get.lazyPut(()=>MyAddonsController());
    Get.lazyPut<LanguageSelectionController>(() => LanguageSelectionController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<ReportsDashboardController>(()=> ReportsDashboardController());
  }
}
