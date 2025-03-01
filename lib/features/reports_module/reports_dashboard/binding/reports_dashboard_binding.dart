import 'package:get/get.dart';
import 'package:ubi_crm/features/reports_module/reports_dashboard/controller/reports_dashboard_controller.dart';

class ReportsDashboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ReportsDashboardController());
  }
}
