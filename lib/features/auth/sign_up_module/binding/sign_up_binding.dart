import 'package:get/get.dart';
import 'package:ubi_crm/features/auth/sign_up_module/controller/sign_up_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}