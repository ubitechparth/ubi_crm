import 'package:get/get.dart';
import 'package:ubi_crm/features/customers_module/customers/presentation/controller/customers_controller.dart';

class CustomersBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CustomersController>(() => CustomersController());
  }
}