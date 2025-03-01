import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Validator {
  // static String? validatePassword(String value) {
  //   if (value=="") {
  //     return 'onLoginEnterPassword'.tr;
  //   }
  //   else if (value.length <= 5) {
  //     return 'onLoginPasswordMustBe8Char'.tr;
  //   }
  //   return null;
  // }
  //
  // static String? validateConfirmPassword(String value, String password) {
  //   if (value.isEmpty) {
  //     return 'error_file_password_field'.tr;
  //   } else if (value.length < 8) {
  //     return 'error_password_length'.tr;
  //   } else if (value != password) {
  //     return 'error_password_confirm_not_match'.tr;
  //   }
  //   return null;
  // }
  //
  // static String? validateEmptyField(String value, String filedName) {
  //   if (value.isEmpty) {
  //     return '$filedName field is empty';
  //   }
  //   return null;
  // }
  //
  // static String? validatePhoneotp(String value) {
  //   Pattern pattern = r'^(?:[1-9])?[0-9]{7,16}$';
  //   RegExp regex = RegExp(pattern as String);
  //   if (!regex.hasMatch(value) || value.length<=6){
  //     return "please_enter_mobile_number".tr;
  //   }
  //   else {
  //     return null;
  //   }
  // }
  //
  //   static String? validatePhoneAddEmp(String value, String countryCode) {
  //   Pattern pattern = r'^(?:[1-9])?[0-9]{7,16}$';
  //   RegExp regex = RegExp(pattern as String);
  //   if (value.isEmpty) {
  //     return "please_enter_mobile_number".tr;
  //   } else if(countryCode=="+91" && value.removeAllWhitespace.length!=10) {
  //     return 'Phone no. should be 10 digits';
  //   } else if(countryCode!="+91" && (value.removeAllWhitespace.length<7)){
  //     return "7_digits".tr;
  //   } else if(countryCode!="+91" && (value.removeAllWhitespace.length>16)){
  //     return "Employee_Page_phone_valid2".tr;
  //   } else if (!regex.hasMatch(value)) {
  //     return "Please enter the valid number";
  //   } else {
  //     return null;
  //   }
  // }
  //
  // static String? addDept(String value) {
  //   if (value=="") {
  //     return "onDepartmentNameValidator".tr;
  //   } else {
  //     return null;
  //   }
  // }
  //
  //
  // static String? fullName(String value) {
  //   if(value.isNotEmpty) {
  //     if (!RegExp(r"^[a-z A-Z/+']+$").hasMatch(value.trim())||RegExp(r'^[+ 0-9]+$').hasMatch(value.trim())) {
  //       return 'Invalid_Name'.tr;
  //     }
  //   }
  //   else {
  //     return "Full_name_is_required".tr;
  //   }
  //   return null;
  //   // if (value.trim().isEmpty || value.trim()=='') {
  //   //   return 'onSignUpWithOtpVerifyFullNameRequired'.tr;
  //   // }
  //   // return null;
  // }
  //
  // static String? validateDateFieldNotEmpty(date) {
  //   if (date == null) {
  //     return 'appleave_enterdate'.tr;
  //   }
  //   return null;
  // }
  //
  // static String? validateEnterDateField(date) {
  //   if (date == null) {
  //     return 'appleave_enterdate'.tr;
  //   }
  //   return null;
  // }
  //
  // static String? validateEnterReason(value) {
  //   if (value.isEmpty) {
  //     return 'appleave_enter_reason'.tr;
  //   }
  //   return null;
  // }
  //
  //
  //
  // static String? validateHolidayName(String value) {
  //   var holidayName = value.trim().length;
  //   if (value.trim()=='') {
  //     return "onHolidayEnterName".tr;
  //   } else if(holidayName==0){return "onHolidayEnterName".tr;}
  //   else {
  //     return null;
  //   }
  // }
  // static String? validateDescription(String value) {
  //   var descriptionName = value.trim().length;
  //   if (value.trim()=='') {
  //     return "error_enter_description".tr;
  //   } else if(descriptionName==0){ return "error_enter_description".tr;} else {
  //     return null;
  //   }
  // }
  // static String? validateStartDate(DateTime? date) {
  //
  //   if (date==null) {
  //     return "onHolidayFromDate".tr;
  //   } else {
  //     addHolidayController.startDate=date;
  //   }
  //   return null;
  // }
  //
  // static String? validateEndtDate(DateTime? endDate) {
  //   if (endDate==null) {
  //     return "onHolidayEndDate".tr;
  //   } else {
  //     addHolidayController.endDate=endDate;
  //
  //     if(addHolidayController.endDate!.difference(addHolidayController.startDate!).inDays<0){
  //       return "onHolidayEndStartDate".tr;
  //     }
  //   }
  //   return null;
  // }
  //
  //
  // static String? companyNameValidator(String value) {
  //   var companyName = value.toString().trim().length;
  //   if (value.trim().isEmpty) {
  //     return 'onSignUpWithOtpVerifyCompanyNameRequired'.tr;
  //   } else if(companyName==0){return 'onSignUpWithOtpVerifyCompanyNameRequired'.tr;}
  //   return null;
  // }
  //
  // static String? validateFullName(String value) {
  //   if(value.isNotEmpty) {
  //     if (!RegExp(r"^[a-z A-Z/+']+$").hasMatch(value.trim())||RegExp(r'^[+ 0-9]+$').hasMatch(value.trim())) {
  //       return 'Invalid Name';
  //     }
  //   }
  //   else {
  //     return "onSignUpWithOtpVerifyFullNameRequired".tr;
  //   }
  //   return null;
  //   // if (value.trim().isEmpty || value.trim()=='') {
  //   //   return 'onSignUpWithOtpVerifyFullNameRequired'.tr;
  //   // }
  //   // return null;
  // }
  //
  // bool isValidEmail(String email) {
  //   final pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  //   final regex = RegExp(pattern);
  //   return regex.hasMatch(email);
  // }
  //
  // // static  String? alidateEmail(String value) {
  // //   // Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  // //
  // //   final pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  // //   final regex = RegExp(pattern);
  // //
  // //   if (value.isEmpty) {
  // //     return 'onSignUpWithOtpVerifyEmailIdRequired'.tr;
  // //   } else if (!regex.hasMatch(value)) {
  // //     return 'onSignUpWithOtpVerifyValidEmailId'.tr;
  // //   } else {
  // //     return null;
  // //   }
  // // }
  //
  static String? emailValidation(String email) {
    // final pattern =  r'^[a-zA-Z0-9_%+-]+(?:\.[a-zA-Z0-9_%+-]+)*@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}$';
    final pattern = r'^[a-zA-Z0-9]+(?:[._%+-][a-zA-Z0-9]+)*@[a-zA-Z0-9_-]+(?:\.[a-zA-Z0-9_-]+)*\.[a-zA-Z]{2,}$';
    final regex = RegExp(pattern);

    if (email.isEmpty) {
      return 'onSignUpWithOtpVerifyEmailIdRequired'.tr;
    } else if (!regex.hasMatch(email)) {
      return 'onSignUpWithOtpVerifyValidEmailId'.tr;
    }
    else{
      return null;
    }

    // List<String> emails = [
    //   "user@example.com",       // Valid
    //   "user.name@example.com",  // Valid
    //   "user@sub.example.com",   // Valid
    //   "user@sub_example.com",   // Valid
    //   "user@sub-example.com",   // Valid
    //   "user.@example.com",      // Invalid (dot before @)
    //   "user@.example.com",      // Invalid (dot after @)
    //   "user!@example.com",      // Invalid (special character before @)
    //   "user@#example.com",      // Invalid (special character after @)
    //   "user_@_example.com",     // Invalid (special character after @)
    //   "user_@-example-.com",    // Invalid (special character after @)
    // ];

    // for (var email in emails) {
    //   print("$email: ${regex.hasMatch(email) ? 'Valid' : 'Invalid'}");
    // }

  }
  //
  //
  // static  String? personalDetailValidatePassword(String value) {
  //   if (value.trim().isEmpty) {
  //     return 'onSignUpWithOtpVerifyPasswordRequired'.tr;
  //   } else if (value.length <= 7) {
  //     return 'onSignUpWithOtpVerifyMinimum8Charcters'.tr;
  //   }
  //   return null;
  // }
  //
  // static String? phoneValidation(value){
  //   bool containsNonDigit = value.toString().contains(RegExp(r'[^\d]'));
  //   if(value==null || value=="") {
  //     return "please_enter_mobile_number".tr;
  //   } else if(containsNonDigit){
  //     return "Invalid_number".tr;
  //   }else if(value.length<8){
  //     return "Please enter atleast 8 digits";
  //   }else if(value.length>15){
  //     return "Please enter atmost 15 digits";
  //   }
  //   return null;
  // }
  //
  // static String? signupPhoneValidation(value){
  //   bool containsNonDigit = value.toString().contains(RegExp(r'[^\d]'));
  //   if(value==null || value=="") {
  //     return "phone_number_is_required".tr;
  //   } else if(containsNonDigit){
  //     return "Invalid_number".tr;
  //   }else if(value.length<7){
  //     return "7_digits";
  //   }else if(value.length>15){
  //     return "Employee_Page_phone_valid2";
  //   }
  //   return null;
  // }
  //
  // static String? nameValidation(value){
  //   var nameTrim = value.toString().trim().length;
  //   if(value==null || value=="") {
  //     return "onHolidayValidator".tr;
  //   }else if(nameTrim==0){
  //     return "onHolidayValidator".tr;
  //   }
  //   return null;
  // }
  // static String? editEmpNameValidation(value){
  //   if(value.isNotEmpty) {
  //     if (!RegExp(r"^[a-z A-Z/+']+$").hasMatch(value)||RegExp(r'^[+ 0-9]+$').hasMatch(value)) {
  //       return 'Invalid Name';
  //     }
  //   }
  //   else {
  //     return "editEmp_nameValidator".tr;
  //   }
  //   return null;
  // }
  //
  // static String? updateDesignationValidation(String value) {
  //   if (value=="") {
  //     return "onDesignationNameValidator".tr;
  //   } else {
  //     return null;
  //   }
  // }
  //
  // static String? updateDepartmentValidation(String value) {
  //   if (value=="") {
  //     return "onDepartmentNameValidator".tr;
  //   } else {
  //     return null;
  //   }
  // }
  //
  // static String? updateShiftValidation(String value) {
  //   var editShiftTrim = value.toString().trim().length;
  //   if (value=="") {
  //     return "onShiftNameValidator".tr;
  //   } else if(editShiftTrim==0){return "onShiftNameValidator".tr;} else{
  //     return null;
  //   }
  // }
  //
  //
  // static String? validationMsg(value){
  //   if (value == null || value.isEmpty) {
  //     return "onGeoFenceNameValidator".tr;
  //   }
  //   return null;
  // }
  //
  // static String? validationSelectDate(date){
  //   if (date == null) {
  //     return 'GeoFence_please_select_date'.tr;
  //   }
  //   return null;
  // }
  //
  // static String? validateEmail(String value) {
  //   if (value.length < 6) {
  //     return "onLoginEnterUsername".tr;
  //   }
  //   return null;
  // }
  //
  // static String? validateShiftName(String value) {
  //   var trimShift = value.toString().trim().length;
  //   if (value.isEmpty) {
  //     return "onAddShiftPageEnterShiftName".tr;
  //   } else if(trimShift==0){return "onAddShiftPageEnterShiftName".tr;}
  //   return null;
  // }
  //
  // static String? validateStartTime(DateTime? startValue) {
  //   if (startValue == null) {
  //     return "onAddShiftPageStartTime".tr;
  //   }
  //   return null;
  // }
  //
  //
  // static String? validateEndTime(DateTime? endValue) {
  //   if (endValue== null) {
  //     return "onAddShiftPageEndTime".tr;
  //   }
  //   return null;
  // }
  //
  // static String? validationClientCompanyName(value){
  //   var trimText = value.trim().length;
  //   if (value == null || value.isEmpty) {
  //     return "error_enter_company_name".tr;
  //   } else if(trimText==0) {
  //     return "error_enter_company_name".tr;
  //   }
  //   return null;
  // }
  // static String? validationCompanyName(value){
  //   var trimText = value.trim().length;
  //   if (value == null || value.isEmpty) {
  //     return "onSignUpWithOtpVerifyCompanyNameRequired".tr;
  //   } else if(trimText==0) {
  //     return "onSignUpWithOtpVerifyCompanyNameRequired".tr;
  //   }
  //   return null;
  // }
  //
  // static String? validationContactPersonName(value){
  //   var trimText = value.trim().length;
  //
  //   if (value == null || value.isEmpty) {
  //     return "error_enter_contact_name".tr;
  //   }else if(trimText==0) {
  //     return "error_enter_contact_name".tr;
  //   }
  //   return null;
  // }
  //
  // static String? companyAddressValidator(value){
  //   var trimAdd = value.toString().trim().length;
  //   if(value=="" || value==null){
  //     return "error_enter_contact_name".tr;
  //   }else if(trimAdd==0){
  //     return "error_enter_contact_name".tr;
  //   } return null;
  // }
  //
  // static String? validationClientPhoneNumber(value){
  //   var trimAdd = value.toString().trim().length;
  //   if (value == null || value.isEmpty) {
  //     return "error_enter_phone_number".tr;
  //   }else if(trimAdd==0){
  //     return "error_enter_phone_number".tr;
  //   }
  //   else {
  //     return null;
  //   }
  // }
  //
  // static String? departmentNameValidator(value){
  //   var departmentTrim = value.toString().trim().length;
  //
  //   if(departmentTrim==0){return "error_enter_department_name".tr;}else if (value == null || value.isEmpty) {
  //     return "error_enter_department_name".tr;
  //   }
  //   else {
  //     return null;
  //   }
  // }  static String? designationNameValidator(value){
  //   var designationName = value.toString().trim().length;
  //
  //   if (value == null || value.isEmpty) {
  //     return "error_enter_designation_name".tr;
  //   } else if(designationName==0){return "error_enter_designation_name".tr;}
  //   else {
  //     return null;
  //   }
  // }
  //
  //
  // static  String? addEmployeeValidateEmail(String value) {
  //   Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  //   RegExp regex = RegExp(pattern as String);
  //   if (value.isNotEmpty) {
  //     if (!regex.hasMatch(value)){
  //       return 'onSignUpWithOtpVerifyValidEmailId'.tr;}
  //
  //   } else if(value==""){
  //
  //     return null;
  //   }
  //   return null;
  // }
  //
  // static String? clientCityValidator(value){
  //   var cityTrim = value.toString().trim().length;
  //   if(value==""||value==null){
  //     return "error_enter_company_name".tr;
  //   } else if(cityTrim==0) {
  //     return "error_enter_company_name".tr;
  //   }
  //   return null;
  // }
  //
  // static String? clientCountryValidator(value){
  //   var countryTrim = value.toString().trim().length;
  //   if(value=="" || value==null){
  //   }else if(countryTrim==0){}return null;
  // }
  //
  // static String? clientCountryCodeValidator(value){
  //   var countryTrim = value.toString().trim().length;
  //   if(value=="" || value==null){
  //     return "error_enter_company_name".tr;
  //   }else if(countryTrim==0){
  //     return "Empty filed Are not Allowed";
  //   }return null;
  // }
  //
  // static String? validateTitle(String value){
  //   var titleTrim = value.toString().trim().length;
  //   if(value==""){
  //     return "Please enter the title";
  //   }else if(titleTrim==0){
  //     return "Please enter the title";
  //   }return null;
  // }
  //
  //
  //
  // static String? emailValidation(String value){
  //   Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  //   RegExp regex = RegExp(pattern as String);
  //   if(value.isNotEmpty) {
  //     if (!regex.hasMatch(value)) {
  //       return 'onSignUpWithOtpVerifyValidEmailId'.tr;
  //     }
  //   }
  //   return null;
  // }
  //
  // static String? setPinValidator(value){
  //   var pinTrim = value.toString().trim().length;
  //   if(value=="" || value ==null) {
  //     return 'onQrKioskPinValidation'.tr;
  //   }
  //   else if(pinTrim==0){
  //     return "onQrKioskEmptyPin".tr;
  //   }else if(pinTrim<4){
  //     return "onQrKioskSettingMinimum4Characters".tr;
  //   }
  //   return null;
  // }
  //
  // static String? recoverPinLoginValidation(value){
  //   var pinTrim = value.toString().trim().length;
  //   if(value=="" || value ==null) {
  //     return 'onRecoverPinLoginID'.tr;
  //   }
  //   else if(pinTrim==0){
  //     return 'onRecoverPinLoginID'.tr;
  //   }
  //   return null;
  // }
  //
  // static String? recoverPinPasswordValidation(value){
  //   var pinTrim = value.toString().trim().length;
  //   if(value=="" || value ==null) {
  //     return 'onRecoverPinPassword'.tr;
  //   }
  //   else if(pinTrim==0){
  //     return "onRecoverPinPassword".tr;
  //   }
  //   return null;
  // }
  //
  // static String? cnfQrPinValidation(value){
  //   var newPin = qrKioskController.newPinController;
  //   var cnfPinTrim = value.toString().trim().length;
  //   if(value=="" || value ==null) {
  //     return 'onQrKioskCnfPinValidation'.tr;
  //   }
  //   else if(cnfPinTrim!=int.parse(newPin!.text)){
  //     return "onQrKioskCnfPinSame".tr;
  //   }
  //   return null;
  // }
  //
  // static String? oldPinValidator(value){
  //   var pinTrim = value.toString().trim().length;
  //   if(value=="" || value ==null) {
  //     return 'onQrKioskEnterOldPin'.tr;
  //   }
  //   else if(pinTrim==0){
  //     return "onQrKioskEnterOldPin".tr;
  //   }
  //   return null;
  // }
  //
  // static String? changePinValidator(value){
  //   var pinTrim = value.toString().trim().length;
  //   if(value=="" || value ==null) {
  //     return 'onQrKioskPinValidation'.tr;
  //   }
  //   else if(pinTrim==0){
  //     return "onQrKioskEmptyPin".tr;
  //   }
  //   return null;
  // }
  //
  // static String? confirmPinValidator(String? value, String newPin){
  //   var pinTrim = value.toString().trim().length;
  //   if(value=="" || value ==null) {
  //     return 'onQrKioskCnfPinValidation'.tr;
  //   }
  //   else if(pinTrim==0){
  //     return "onQrKioskCnfPinValidation".tr;
  //   }else if(value!=newPin){
  //     return "onQrKioskCnfPinSame".tr;
  //   }
  //   return null;
  // }
  //
  // static String? cnfSetNewPinValidator(String? value, String cnfNewPin){
  //
  //   var pinTrim = value.toString().trim().length;
  //   if(value=="" || value ==null) {
  //     return 'onQrKioskCnfPinValidation'.tr;
  //   }
  //   else if(pinTrim==0){
  //     return "onQrKioskCnfPinValidation".tr;
  //   }else if(value!=cnfNewPin){
  //     return "onQrKioskCnfPinSame".tr;
  //   }
  //   return null;
  // }
  //
  // static String? recoverPinValidator(String value, String cnfNewPin){
  //
  //   var pinTrim = value.toString().trim().length;
  //   if(value=="") {
  //     return 'onQrKioskCnfPinValidation'.tr;
  //   }
  //   else if(pinTrim==0){
  //     return "onQrKioskCnfPinValidation".tr;
  //   }else if(value!=cnfNewPin){
  //     return "onQrKioskCnfPinSame".tr;
  //   }
  //   return null;
  // }
  // static String? validateHRMEnterDateField(date) {
  //   if (date == null || date =="") {
  //     return 'appleave_enterdate'.tr;
  //   }
  //   return null;
  // }
  // static String? validateHRMEnterReason(value) {
  //   if (value.isEmpty) {
  //     return 'appleave_enter_reason'.tr;
  //   }
  //   return null;
  // }
  // static String? validateHRMEnterToDate(dt) {
  //   if (dt == null) {
  //     return 'appleave_entertodate'.tr;
  //   }
  //   /* else if (ApplyLeaveHRM.endDate.isBefore(ApplyLeaveHRM.startDate)) {
  //     return 'appleave_todate_notsmaller'.tr;
  //   }*/
  //   return null;
  // }
  // static String? validateOldPassword(String value){
  //   var passTrim = value.toString().trim().length;
  //
  //   if(passTrim==0){
  //     return 'OnSettingsChange_validateOld_pwd'.tr;
  //
  //   }else
  //   if (value.isEmpty) {
  //     return "OnSettingsChange_validateOld_pwd".tr;
  //   }
  //   return null;
  // }
  //
  // static String? addClientAddressValidation(String address) {
  //   var radiusTrim = address.toString().trim().length;
  //   if (radiusTrim == 0) {
  //     return "address_text".tr;
  //   }
  //   return null;
  // }
  //
  // static String? addClientCityValidation(String city) {
  //   var radiusTrim = city.toString().trim().length;
  //   if (radiusTrim == 0) {
  //     return "city_text".tr;
  //   }
  //   return null;
  // }
  //
  //
  // static String? radiusValidation(String radius) {
  //   var radiusInt = radius=="" ? 0 :int.parse(radius.toString());
  //   if (radius.isEmpty || radius=='' ) {
  //     return "radius_text".tr;
  //   }else if(radiusInt<100){
  //     return "radiusLessThan".tr;
  //   }
  //   return null;
  // }
  //
  // static String? scheduleDemoDate(value) {
  //   var passTrim = value.toString().trim().length;
  //   if (passTrim == 0 || value == null || value==0) {
  //     return 'schedule_date'.tr;
  //   }
  //   return null;
  // }
  //
  //
  // static String? scheduleDemoTime(String value) {
  //   var passTrim = value.toString().trim().length;
  //   if (passTrim == 0 || value == 'Select a Time(IST)') {
  //     return 'schedule_time'.tr;
  //   }
  //   return null;
  // }
  // static String? otpEmailValidation(String value){
  //   Pattern pattern =  r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
  //
  //
  //   RegExp regex = RegExp(pattern as String);
  //   if(value.isNotEmpty) {
  //     if (!regex.hasMatch(value)) {
  //       return 'onSignUpWithOtpVerifyValidEmailId'.tr;
  //     }
  //   }
  //   else {
  //     return "EnterValidEmail".tr;
  //   }
  //   return null;
  // }
  //
  //
  // static String? emailOtpValidation(String emailOtp) {
  //   var radiusTrim = emailOtp.toString().trim().length;
  //   if (radiusTrim == 0) {
  //     return "EnterVerificationCode".tr;
  //   }
  //   return null;
  // }
  // static String? validateEnterForDeleteReason(value) {
  //   if (value.isEmpty) {
  //     return 'appleave_enter_reason'.tr;
  //   }
  //   return null;
  // }
  //
  // static String? validateBroadcastTitle(String value) {
  //   var title = value.trim().length;
  //   if (value.trim()=='') {
  //     return "broadcast_enter_title".tr;
  //   } else if(title==0){return "broadcast_enter_title".tr;}
  //   else {
  //     return null;
  //   }
  // }
  //
  // static String? validateBroadcastMessage(String value) {
  //   var message = value.trim().length;
  //   if (value.trim()=='') {
  //     return "broadcast_enter_message".tr;
  //   } else if(message==0){return "broadcast_enter_message".tr;}
  //   else {
  //     return null;
  //   }
  // }
  //
  // static String? gstValidation(String value){
  //   Pattern pattern = r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';
  //   RegExp regex = RegExp(pattern as String);
  //   if (!regex.hasMatch(value)) {
  //     return "BillingGstValid".tr;
  //   } else {
  //     return null;
  //   }
  //
  // }
  //
  // static String? companyName(value){
  //   if (value == null || value.isEmpty) {
  //     return "BillingCompNameValid".tr;
  //   }
  //   return null;
  // }
  // static String? remark(value){
  //   if (value == null || value.isEmpty) {
  //     return "Please fill remark";
  //   }
  //   return null;
  // }
  // static String? reason(value){
  //   if (value == null || value.isEmpty) {
  //     return "Please select reason";
  //   }
  //   return null;
  // }
  //
  // static String? projectName(value){
  //   if (value == null || value.isEmpty) {
  //     return "Please_select_project_Text".tr;
  //   }
  //   return null;
  // }
  //
  // static String? milestonesName(value){
  //   if (value == null || value.isEmpty) {
  //     return "Please_select_milestone_Text".tr;
  //   }
  //   return null;
  // }
  //
  // static String? validateRegularizationEnterReason(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'appleave_enter_reason'.tr;
  //   }
  //   return null;
  // }
}
