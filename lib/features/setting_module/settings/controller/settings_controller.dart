import 'package:get/get.dart';

class SettingsController extends GetxController {


  RxBool loader = false.obs;
  RxString qRKioskPin = ''.obs;
   RxBool offAllNotification = false.obs;

  @override
  void onInit() async {
    loader.value = true;
    loader.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    loader.value = true;

    Future.delayed(const Duration(seconds: 5));
    loader.value = false;
  }


}