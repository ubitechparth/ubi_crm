import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/globals.dart';
import 'package:ubi_crm/core/routes/route_constant.dart';
import 'package:ubi_crm/core_widget/loader.dart';
import 'package:ubi_crm/core_widget/snack_bar_widget.dart';
import 'package:ubi_crm/features/auth/login_sign_up/data/datasources/login_remote_source.dart';
import 'package:ubi_crm/features/auth/login_sign_up/data/models/check_user_exist_model.dart';
import 'package:ubi_crm/features/auth/login_sign_up/data/repositories/login_repo.dart';
import 'package:ubi_crm/features/auth/login_sign_up/domain/usecases/check_user_exist.dart';
import 'package:ubi_crm/features/auth/login_sign_up/domain/usecases/login_user_case.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/widget/login_password_page.dart';

class LoginSignupController extends GetxController{

  //User cases
  late CheckUserExistUseCase userExistUseCase;
  late LoginUseCase loginUseCase;
  late CheckUserExistModel checkUserExistModel;


  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userLoginValue = TextEditingController();

  String dialCodeNumber = '';
  String apiStorePwd = '';
  String countryCode = '';
  RxInt charCountEmail = 0.obs;
  RxBool isObscure = true.obs;
  RxBool showError = false.obs;
  RxBool showLengthError = false.obs;
  RxBool showIndLengthError = false.obs;
  RxBool dialCodeLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();

    userExistUseCase = CheckUserExistUseCase(LoginRepositoryImpl(LoginRemoteDataSourceImpl()));
    checkUserExistModel = CheckUserExistModel();
    emailController.addListener(() {
      charCountEmail.value = emailController.text.length;
    });
    password.clear();
  }



  //User Exists or NotExists
  Future<void> checkUserExistOrNot(String emailNumber, String countryCode) async {
    Get.dialog(Center(child: Loader2()));

    try {
      // Execute the use case to check if the user exists
      final response = await userExistUseCase.execute(
        mobileNumberController.text,
        countryCode.toString().replaceAll('+', ''),
      );

      // Close the loading dialog
      Get.back();

      // Delay for smoother UI transitions (if needed)
      await Future.delayed(const Duration(milliseconds: 500));

      if (response.isSuccess) {
        final CheckUserExistModel checkUserExist = CheckUserExistModel.fromJson(jsonDecode(response.data.toString()));

        switch (checkUserExist.data?.status) {
          case 1:
          // User exists, navigate to login password page
            apiStorePwd = checkUserExist.data!.pwd.toString();
            Get.to(() => LoginPasswordPage());
            break;

          case 2:
          // User does not exist, navigate to signup page
            if (emailNumber.contains('@')) {
              // Handle email case
              final Map<String,String> map = {
                "emailNumber": emailNumber,
                "countryCode": countryCode,
              };
              Get.toNamed(RouteConstant.signupPage, arguments: map);
              await Future.delayed(const Duration(seconds: 2));
              emailController.clear();
            } else {
              // Handle phone number case
              if (countryCode != '+91' && emailNumber.length < 7) {
                SnackBarWidget().warningMsg(message:  "7_digits".tr);
                return;
              } else if (countryCode != '+91' && emailNumber.length > 15) {
                SnackBarWidget().warningMsg(message: "Employee_Page_phone_valid2".tr);
                return;
              } else {
                final map = {
                  "emailNumber": emailNumber,
                  "countryCode": countryCode,
                };
                Get.toNamed(RouteConstant.signupPage, arguments: map);
              }
            }
            break;

          case 0:
            SnackBarWidget().warningMsg(message: "login_inactive_user".tr);
            break;

          case 3:
            SnackBarWidget().warningMsg(message: "user_are_delete".tr);
            break;

          case 4:
            SnackBarWidget().warningMsgDemo(
              "Invalid_Number".tr,
              "Please_enter_a_valid_10digit_phone_number".tr,
            );
            break;

          case 5:
            SnackBarWidget().warningMsgDemo(
              "Invalid_Number".tr,
              "Phone_number_cannot_start_with_0".tr,
            );
            break;

          default:
            SnackBarWidget().warningMsg(message: '${'Something_went_wrong'.tr} ${'please_try_after_sometime'.tr}');
        }
      }else{
        Get.back(); // Ensure loading dialog is closed
        SnackBarWidget().warningMsg(message:  '${'Something_went_wrong'.tr} ${'please_try_after_sometime'.tr}');
      }

    } catch (e) {
      // Handle unexpected errors
      Get.back(); // Ensure loading dialog is closed
      SnackBarWidget().warningMsg(message:  '${'Something_went_wrong'.tr} ${'please_try_after_sometime'.tr}');
      debugPrint('Error in checkUserExistOrNot: $e');
    }
  }

  // Login API
  Future<void> loginAPI() async {
    if(apiStorePwd !=password.text){
      SnackBarWidget().warningMsg(message: "invalid_credential".tr);
      return;
    }
    Get.dialog(Center(child: Loader2(),));


    // userLoginValue.text=mobileNumberController.text.isEmpty? emailController.text:mobileNumberController.text;
    //
    // debugPrint('Hello i am here Line 680======> ${userLoginValue.text}');
    // final result = await loginUseCase.execute(userLoginValue.text, password.text,countryCode, 'manual',0);
    // Get.back();
  /*  if (result != (null) && result.status == 'true') {
      await setHRMCheckLoginPreference(result).then((_) async {
        await getUserInfo().then((_) {
          if(globals.appPrefs.tutorialScreen){
            if(checkUser() && globals.attAppName == 'ubiAttendance'){
              Get.offAllNamed(RouteConstant.showTutorialAttendance);
            } else {
              Get.offAllNamed(RouteConstant.showTutorialHrm);
            }
          } else {
            Get.offAllNamed(RouteConstant.dashboard);
          }
        });
      });
    }
    else {
      _handleLoginErrors(result);
    }*/

  }
  callBackFunction(String name, String dialCode, String flag, String digit,String timeZone) async {

    dialCodeLoading.value=true;

    // dialCodeNumber = dialCode==''? appPrefs.countryCode : dialCode;
    dialCodeNumber =  dialCode;
    // digitNo = digit==''?appPrefs.countryDigit:digit;
    // countryName = name==''?appPrefs.countryName:name;
    countryCode =dialCodeNumber;
    dialCodeLoading.value=false;
    // selectCountryIdService();
  }

  //get country code
  /*Future<void>selectCountryIdService() async {
    try {
      final result = await _loginSignupRepo.selectCountryIdAPI(countryName,countryCode);
      if(result!=null){
        appPrefs.countryCodeId= result[0].id??'93';
        appPrefs.countryName= result[0].name??'India';
        appPrefs.countryCode=result[0].countrycode??'+91';
        countryCodeId =  appPrefs.countryCode;
        if (appPrefs.countryName == 'India') {
          isInternalNo.value = false;
        } else {
          isInternalNo.value = true;
        }}else{
        appPrefs.countryCodeId = '93';
        appPrefs.countryName = 'India';
        appPrefs.countryCode = '+91';
        countryCodeId =  appPrefs.countryCode;
      }
    } on Exception {
      appPrefs.countryCodeId = '93';
      appPrefs.countryName = 'India';
      appPrefs.countryCode = '+91';
      countryCodeId =  appPrefs.countryCode;
    }
  }*/

  //Manage country code icons show or not
  //  isEmailOrNumber(value){
  //   final bool isPhoneNumber = RegExp(r'^\d+$').hasMatch(value);
  //   if(isPhoneNumber){
  //     // showCountryCodeIcon.value = true;
  //   } else {
  //     // showCountryCodeIcon.value = false;
  //   }
  // }


  Future<void> launchTermURL() async {
    if(isNetworkAvailable.value == true) {
     // await launchUrl(Uri.parse(UrlCollection.teams));
    }
    else{
      SnackBarWidget().alertMsg("NoInternetText".tr);
    }
  }

  Future<void> launchPrivacyURL() async {
    if(isNetworkAvailable.value == true) {
      //await launchUrl(Uri.parse(UrlCollection.privacy));
    }
    else{
      SnackBarWidget().alertMsg("NoInternetText".tr);
    }
  }
  void changeObSecure() {
    isObscure.value = !(isObscure.value);
  }
}
