import 'package:get/get.dart';
import 'package:ubi_crm/features/addons_module/myAddons/controller/my_addons_controller.dart';
import 'package:ubi_crm/features/addons_module/suggestedAddons/controller/suggested_addons_controller.dart';

class SuggestedAddonsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAddonsController>(() => MyAddonsController(),);
    Get.lazyPut<SuggestedAddonsController>(() => SuggestedAddonsController(),
    );
  }
}
