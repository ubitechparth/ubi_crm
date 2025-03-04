import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubi_crm/core/globals.dart';
import 'package:ubi_crm/core/routes/route_constant.dart';
import 'package:ubi_crm/core/utils/helper.dart';
import 'package:ubi_crm/core/utils/shared_preferences.dart';
import 'package:ubi_crm/core_widget/common_loader.dart';
import 'package:ubi_crm/core_widget/loader.dart';
import 'package:ubi_crm/core_widget/snack_bar_widget.dart';
import 'package:ubi_crm/features/auth/login_sign_up/data/datasources/login_remote_source.dart';
import 'package:ubi_crm/features/auth/login_sign_up/data/models/check_user_exist_model.dart';
import 'package:ubi_crm/features/auth/login_sign_up/data/models/login_model.dart';
import 'package:ubi_crm/features/auth/login_sign_up/data/repositories/login_repo.dart';
import 'package:ubi_crm/features/auth/login_sign_up/domain/usecases/check_user_exist.dart';
import 'package:ubi_crm/features/auth/login_sign_up/domain/usecases/login_use_case.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/widget/login_password_page.dart';
import 'package:google_sign_in/google_sign_in.dart' as sign_in;

class LoginSignupController extends GetxController {
  //User cases
  late CheckUserExistUseCase userExistUseCase;
  late LoginUseCase loginUseCase;

  late CheckUserExistModel checkUserExistModel;

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userLoginValue = TextEditingController();


  String apiStorePwd = '';

  String countryCode = '';
  String countryName = '';

  RxInt charCountEmail = 0.obs;
  RxBool isObscure = true.obs;
  RxBool showError = false.obs;
  RxBool showLengthError = false.obs;
  RxBool showIndLengthError = false.obs;
  RxBool dialCodeLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();

    userExistUseCase =
        CheckUserExistUseCase(LoginRepositoryImpl(LoginRemoteDataSourceImpl()));
    loginUseCase =
        LoginUseCase(LoginRepositoryImpl(LoginRemoteDataSourceImpl()));

    checkUserExistModel = CheckUserExistModel();

    emailController.addListener(() {
      charCountEmail.value = emailController.text.length;
    });

    password.clear();
  }

  //User Exists or NotExists
  Future<void> checkUserExistOrNot(String userValue, String countryCode) async {
    Get.dialog(Center(child: Loader2()));

    try {
      // Execute the use case to check if the user exists
      final response = await userExistUseCase.execute(
        userValue,
        countryCode,
      );

      // Close the loading dialog
      Get.back();

      // Delay for smoother UI transitions (if needed)
      await Future.delayed(const Duration(milliseconds: 500));

      if (response.isSuccess) {
        final CheckUserExistModel checkUserExist =
            CheckUserExistModel.fromJson(jsonDecode(response.data.toString()));
        // Handle the user status based on the response
        await _handleUserStatus(checkUserExist, userValue, countryCode);
      } else {
        _handleError('Something_went_wrong');
      }
    } catch (e) {
      // Handle unexpected errors
      _handleError('Something_went_wrong');
      debugPrint('Error in checkUserExistOrNot: $e');
    }
  }

  Future<void> _handleUserStatus(
    CheckUserExistModel checkUserExist,
    String userValue,
    String countryCode,
  ) async {
    final userStatus = checkUserExist.data?.status;

    switch (userStatus) {
      case 1:
        apiStorePwd = checkUserExist.data!.pwd.toString();
        Get.to(() => LoginPasswordPage());
        break;

      case 2:
        // User does not exist, navigate to signup page
        await _navigateToSignupPage(userValue, countryCode);
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
        SnackBarWidget().warningMsg(
          message:
              '${'Something_went_wrong'.tr} ${'please_try_after_sometime'.tr}',
        );
    }
  }

  Future<void> _navigateToSignupPage(
      String userValue, String countryCode) async {
    // Check if the user provided an email or phone number
    if (userValue.contains('@')) {
      // Handle email case
      final Map<String, String> map = {
        "emailNumber": userValue,
        "countryCode": countryCode,
      };
      Get.toNamed(RouteConstant.signupPage, arguments: map);
      await Future.delayed(const Duration(seconds: 2)); // Delay before clearing
      emailController.clear();
    } else {
      // Handle phone number case
      if (countryCode != '+91' && userValue.length < 7) {
        SnackBarWidget().warningMsg(message: "7_digits".tr);
      } else if (countryCode != '+91' && userValue.length > 15) {
        SnackBarWidget().warningMsg(message: "Employee_Page_phone_valid2".tr);
      } else {
        final Map<String, String> map = {
          "emailNumber": userValue,
          "countryCode": countryCode,
        };
        Get.toNamed(RouteConstant.signupPage, arguments: map);
      }
    }
  }

  void _handleError(String message) {
    // Close the loader and show an error message
    Get.back();
    SnackBarWidget().warningMsg(
      message: '${message.tr} ${'please_try_after_sometime'.tr}',
    );
  }
  // Login API
  Future<void> loginAPI() async {
    if (apiStorePwd != password.text) {
      SnackBarWidget().warningMsg(message: "invalid_credential".tr);
      return;
    }

    Get.dialog(Center(
      child: Loader2(),
    ));

    userLoginValue.text = mobileNumberController.text.isEmpty
        ? emailController.text
        : mobileNumberController.text;

    final response = await loginUseCase.execute(encode5t(userLoginValue.text), encode5t(password.text));

    LoginModel loginResponse = LoginModel.fromJson(jsonDecode(response.data.toString()));
    Get.back();

    await SharedPreferencesValue().saveLoginModel(loginResponse);

    if (response.isSuccess) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      Get.offAllNamed(RouteConstant.dashboard);
    }
  }

  callBackFunction(String name, String dialCode, String flag, String digit, String timeZone) async {
    dialCodeLoading.value = true;
    countryName = name == '' ? appPrefs.countryName : name;
    countryCode = dialCode;
    dialCodeLoading.value = false;
  }

  //Login & Signup with google
  Future<void> googleLogin(BuildContext context) async {
    try {
      CommonLoader().showOverlayLoader();
      final sign_in.GoogleSignIn googleSignIn = sign_in.GoogleSignIn(scopes: ['email']);
      final sign_in.GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      googleSignIn.signOut();
      /*    if (googleSignInAccount != null) {
        String googleEmail = googleSignInAccount.email;
        final results = await _loginSignupRepo.googleLoginApi(googleEmail, '');
        if(results != null){
          if (results.response == 1) {
            LoginDetail localDbStore = LoginDetail();
            localDbStore.tableDelete();
            var saveValue = LoginDetail(
              id: null,
              empId: results.empid,
              orgId: results.orgid,
              orgName: results.orgName.toString(),
              fname: results.fname.toString(),
              designationName: results.designationName.toString(),
              departmentName: results.departmentName.toString(),
            );
            localDbStore.insert(saveValue);
            final result = await _loginSignupRepo.checkLoginAPI(googleEmail, results.userPwd.toString(),countryCode, 'google', 0);
            if(results != (null)){
              if (results.response == 1) {
                final result = await _loginSignupRepo.checkLoginAPI(googleEmail, results.userPwd.toString(),countryCode, 'google', 0);
                if(result != null) {
                  if (result.status == 'true') {
                    await setHRMCheckLoginPreference(result).then((_) async {
                      await getUserInfo().then((_) {
                        if(globals.appPrefs.tutorialScreen) {
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
                    Get.back();
                    _handleLoginErrors(result);
                  }
                }
                else {
                  Get.back();
                  _handleLoginErrors(result);  //handle null exception
                }
              }
              else if (results.response == 0) {
                Get.back();
                Map<String, dynamic> map = {
                  "emailNumber": googleEmail,
                  "applyMethod": applyMethod
                };
                Get.toNamed(RouteConstant.postSignupScreen, arguments: map);
              }
              else if (results.response == 2) {
                await Future.delayed(const Duration(seconds: 1));
                Get.back();
                doNotify.warningMsg("login_inactive_user".tr,);
              }
              else {
                Get.back();
                doNotify.warningMsg('${'Something_went_wrong'.tr} ${'please_try_after_sometime'.tr}');
              }
            }
            else {
              Get.back();
              _handleLoginErrors(result);  //handle null exception
            }
          }
          else if (results.response == 0) {
            Get.back();
            Map<String, dynamic> map = {
              "emailNumber": googleEmail,
              "applyMethod": applyMethod
            };
            Get.toNamed(RouteConstant.postSignupScreen, arguments: map);
          }
          else if (results.response == 2) {
            await Future.delayed(const Duration(seconds: 1));
            Get.back();
            doNotify.warningMsg("login_inactive_user".tr,);
          }
          else {
            Get.back();
            doNotify.warningMsg('${'Something_went_wrong'.tr} ${'please_try_after_sometime'.tr}');
          }
        }
        else {
          if(globals.appPrefs.ubiServer == false) {
            Get.back();
            doNotify.warningMsg("serverNotResponseText".tr,);
          } else {
            Get.back();
            doNotify.warningMsg('${'Something_went_wrong'.tr} ${'please_try_after_sometime'.tr}');
          }
        }
      }
      else {
        Get.back();
      }*/
    } on PlatformException catch (e) {
      Get.back();
      if(e.code == 'network_error') {
        SnackBarWidget().warningMsg(message: "InternetConnectionNotFoundText".tr);
      } else {
        SnackBarWidget().warningMsg(message: "Something_went_wrong".tr);
      }
      if (kDebugMode) {
        debugPrint('Error on google login: $e');
        debugPrint('Error on google login: ${e.code}');
      }
    } catch (e) {
  /*    Get.back();
      doNotify.warningMsg("Something_went_wrong".tr);
      // Handle any other exceptions here
      if (kDebugMode) {
        debugPrint('General error: $e');
      }*/
    }
  }

  Future<void> launchTermURL() async {
    if (isNetworkAvailable.value == true) {
      // await launchUrl(Uri.parse(UrlCollection.teams));
    } else {
      SnackBarWidget().alertMsg("NoInternetText".tr);
    }
  }

  Future<void> launchPrivacyURL() async {
    if (isNetworkAvailable.value == true) {
      //await launchUrl(Uri.parse(UrlCollection.privacy));
    } else {
      SnackBarWidget().alertMsg("NoInternetText".tr);
    }
  }

  void changeObSecure() {
    isObscure.value = !(isObscure.value);
  }
}
