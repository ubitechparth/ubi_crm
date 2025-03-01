import 'package:get/get.dart';
import 'package:ubi_crm/core/hive_prefs.dart';

  RxInt languageIndex = 0.obs;
  AppPreferences appPrefs = AppPreferences.instance;
  RxBool isNetworkAvailable = false.obs;
RxString currentCountry = ''.obs;
RxInt animatedIcon = 0.obs;
RxInt initialIndex=0.obs;
RxString firstName = ''.obs;
RxString designationName = ''.obs;
RxInt userRoleStatus = 0.obs;
int serverConnected = 1;