import 'package:get/get.dart';
import 'package:ubi_crm/features/lead_module/lead/presentation/controller/lead_controller.dart';

class LeadBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LeadController>(() => LeadController());
  }
}