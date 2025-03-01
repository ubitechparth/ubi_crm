import 'package:get/get.dart';
import 'package:ubi_crm/features/addons_module/myAddons/controller/my_addons_controller.dart';

class MyAddonsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>MyAddonsController());
  }
}
