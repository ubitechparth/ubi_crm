import 'package:get/get.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/login_signup_controller.dart';

class LoginSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginSignupController());
  }
}