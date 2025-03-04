
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/core/globals.dart';
import 'package:ubi_crm/core_widget/common_loader.dart';
import 'package:ubi_crm/features/auth/sign_up_module/data/dataSources/sign_up_remote_source.dart';
import 'package:ubi_crm/features/auth/sign_up_module/data/repositories/sign_up_repo.dart';
import 'package:ubi_crm/features/auth/sign_up_module/domain/usecases/temp_sign_use_case.dart';

class SignupController extends GetxController {

  late TempSignUpUseCase tempSignUpUseCase;

  // Number employees list
  RxList<String> options = [
    '1-10',
    '11-30',
    '31-50',
    '51-100',
    '101-200',
    '201-500',
    '501-1000',
    '1000+'
  ].obs;

  RxList<String> rolesList = [
    'Business Owner',
    'Attendance Admin',
    'HR Manager',
    'IT Manager',
    'Employee',
    'Other',
  ].obs;

  //Industry list
  RxList<Map<String, String>> industry = [
    {'title': 'Services', 'icon': SignUpPageAssets().services,},
    {'title': 'Security', 'icon': SignUpPageAssets().security,},
    {'title': 'Healthcare', 'icon': SignUpPageAssets().healthcare,},
    {'title': 'Manufacturing', 'icon': SignUpPageAssets().manufacturing,},
    {'title': 'Construction', 'icon': SignUpPageAssets().construction,},
    {'title': 'Education', 'icon': SignUpPageAssets().education,},
    {'title': 'Hospitality', 'icon': SignUpPageAssets().hospitality,},
    // {'title': 'Retail', 'icon': SignUpPageAssets().retail,},
    {'title': 'IT and Technology', 'icon': SignUpPageAssets().itIndustry,},
    {'title': 'Restaurants', 'icon': SignUpPageAssets().restaurants,},
    {'title': 'Travel and Logistics', 'icon': SignUpPageAssets().travel,},
    {'title': 'Other Industries', 'icon': SignUpPageAssets().otherIndustry,},
  ].obs;

  RxInt selectedIndex = (-1).obs; //Number of employees index
  RxInt selectedIndustryIndex = (-2).obs; //Industry Index
  RxInt showPage = 1.obs; //Manage show next widget
  RxInt charCountName = 0.obs;
  RxInt charCountEmail = 0.obs;
  RxInt charCountOrg = 0.obs;
  RxInt charCountDesignation = 0.obs;

  // add multiple features start
  RxBool featureAttendance = false.obs;
  RxBool featureLeave = false.obs;
  RxBool featurePayroll = false.obs;
  RxBool featureVisit = false.obs;
  RxBool featureTimesheet = false.obs;
  RxBool nameIsEmpty = false.obs;
  RxBool errorMessageBool = true.obs;
  RxBool companyErrorBool = true.obs;
  RxBool emailErrorBool = true.obs;
  RxBool numberErrorBool = true.obs;
  RxBool passwordErrorBool = true.obs;

  // add multiple features end

  RxBool isObscure = true.obs;
  RxBool isLoading = true.obs; // verify otp btn on opt verify screen
  RxBool saveCircularBar = false.obs;
  RxBool showField = false.obs; //false means show number field
  bool both = false; //false means show country code icon and true means email field
  bool isSignup = true;

  String selectEmpNo = '1-10';
  String selectIndustry = 'Other Industries';
  String dialCodeNumber = '';
  String digitNo = '';
  String countryName = '';
  String countryCode = '';
  String countryCodeId = '';
  String firstName = '';
  String appleAuthToken = '';
  RxString companyFullName = ''.obs;

  dynamic argument;
  String userId = '';
  String applyMethod = '';
  String lastCountryCode = '';

  // AlertNotification notify = AlertNotification();
  final GlobalKey<FormState> finalSignupFormKey = GlobalKey<FormState>();

  TextEditingController userName = TextEditingController();
  TextEditingController businessEmail = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController designationName = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    tempSignUpUseCase = TempSignUpUseCase(SignRepositoryImpl(SignUpRemoteDataSourceImpl()));
    argument = Get.arguments;
    if (argument != null) {
      userId = argument['emailNumber'] ?? '';
      lastCountryCode = argument['countryCode'] ?? '';
      applyMethod = argument['applyMethod'] ?? '';
      appleAuthToken = argument['appleAuthToken'] ?? '';
      showField.value = isNumeric(userId.toString());
      if (showField.value == true) {
        phoneNumber.text = userId;
        countryCode = lastCountryCode;
      } else {
        businessEmail.text = userId;
      }
    }

    userName.addListener(() {
      charCountName.value = userName.text.length;
    });
    businessEmail.addListener(() {
      charCountEmail.value = businessEmail.text.length;
    });
    companyName.addListener(() {
      charCountOrg.value = companyName.text.length;
    });
    designationName.addListener(() {
      charCountDesignation.value = designationName.text.length;
    });
  }

  bool isNumeric(String input) {
    final numericRegex = RegExp(r'^\d+$');
    return numericRegex.hasMatch(input);
  }

  splitName() {
    List splitName = userName.text.split(' ');
    firstName = splitName.length > 1 ? splitName[0] : userName.text;
  }

  void changeObSecure() {
    isObscure.value = !(isObscure.value);
  }

  //get number of employees index
  void empIndex(int index) {
    selectedIndex.value = index;
  }

  //get industry index
  void industryIndex(int index) {
    selectedIndustryIndex.value = index;
  }


  callBackFunction(String name, String dialCode, String flag, String digit, String timeZone) async {
    dialCodeNumber = dialCode == '' ? appPrefs.countryCode : dialCode;
    digitNo = digit == '' ? appPrefs.countryDigit : digit;
    countryName = name == '' ? appPrefs.countryName : name;
    countryCode = dialCodeNumber;
    // selectCountryIdService();
  }



  // void postSignupNew() async {
  //   List finalFormData = [];
  //   var temp = {'postSignUp': await addPostFormData()};
  //   finalFormData.add(temp);
  //   final result = await _loginSignupRepo.fillPostSignupForm(
  //       postSignupData: jsonEncode(finalFormData));
  //   log(result.toString());
  // }


  RxString errorMessage = ''.obs;
  RxString companyErrorMessage = ''.obs;
  RxString emailErrorMessage = ''.obs;
  RxString numberErrorMessage = ''.obs;
  RxString passwordErrorMessage = ''.obs;

  // Custom validation logic
  validateNameInput() {
    if (userName.text.isEmpty) {
      errorMessage.value = "Full_name_is_required".tr;
      errorMessageBool.value = false;
      return;
    } else if (userName.text.isNotEmpty) {
      if (!RegExp(r"^[a-z A-Z/+']+$").hasMatch(userName.text.trim()) ||
          RegExp(r'^[+ 0-9]+$').hasMatch(userName.text.trim())) {
        errorMessage.value = 'Invalid_Name'.tr;
        errorMessageBool.value = false;
        return;
      }else {
        errorMessageBool.value = true;
        return;
      }
    }else {
      errorMessageBool.value = true;
      return;
    }
  }

  companyNameValidation() {
    if (companyName.text.isEmpty) {
      companyErrorMessage.value = "onSignUpWithOtpVerifyCompanyNameRequired".tr;
      companyErrorBool.value = false;
      return;
    } else {
      companyErrorBool.value = true;
      return;
    }
  }

  static  String? personalDetailValidatePassword(String value) {
    if (value.trim().isEmpty) {
      return ''.tr;
    } else if (value.length <= 7) {
      return 'onSignUpWithOtpVerifyMinimum8Charcters'.tr;
    }
    return null;
  }

  validatePassword() {
    if (passwordController.text.isEmpty) {
      passwordErrorMessage.value = "onSignUpWithOtpVerifyPasswordRequired".tr;
      passwordErrorBool.value = false;
      return;
    } else if (passwordController.text.length <= 7) {
      passwordErrorMessage.value = "onSignUpWithOtpVerifyMinimum8Charcters".tr;
      passwordErrorBool.value = false;
      return;
    }else {
      passwordErrorBool.value = true;
      return;
    }
  }

  validateEmail(String value) {
    Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern as String);
    if (value.isEmpty) {
      emailErrorMessage.value='onSignUpWithOtpVerifyEmailIdRequired'.tr;
      emailErrorBool.value = false;
      return;
    } else if (!regex.hasMatch(value)) {
      emailErrorMessage.value= 'onSignUpWithOtpVerifyValidEmailId'.tr;
      emailErrorBool.value = false;
      return;
    } else {
      emailErrorBool.value = true;
      return;
    }
  }

  signupPhoneValidation(value){
    bool containsNonDigit = value.toString().contains(RegExp(r'[^\d]'));
    if(value==null || value=="") {
      numberErrorMessage.value= "phone_number_is_required".tr;
      numberErrorBool.value=false;
      return;
    } else if(containsNonDigit){
      numberErrorMessage.value= "Invalid_number".tr;
      numberErrorBool.value=false;
      return;
    }else if(value.length<7){
      numberErrorMessage.value= "7_digits".tr;
      numberErrorBool.value=false;
      return;
    }else if(value.length>15){
      numberErrorMessage.value= "Employee_Page_phone_valid2".tr;
      numberErrorBool.value=false;
      return;
    }else{
      numberErrorBool.value=true;
    }
  }

  clearForm(){
    if (showPage.value == 1) {
      Get.back();
      Future.delayed(const Duration(milliseconds: 500));
      userName.clear();
      businessEmail.clear();
      passwordController.clear();
      companyName.clear();
      designationName.clear();
    } else {
      if (showPage.value == 2) {
        Get.back();
      } else {
        showPage.value--;
      }
    }
  }

  tempSignup() async {

    CommonLoader().showOverlayLoader();
    await tempSignUpUseCase.execute(
        userName.text,
        companyName.text,
        passwordController.text,
        countryCode,phoneNumber.text,businessEmail.text,);

  }
}
