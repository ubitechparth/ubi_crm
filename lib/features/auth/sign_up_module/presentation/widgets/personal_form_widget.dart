import 'package:flutter/material.dart';
import 'package:ubi_crm/core/utils/Internet_network/network_handle.dart';
import 'package:ubi_crm/core_widget/country_picker.dart';
import 'package:ubi_crm/core_widget/custom_elevated_button_widget.dart';
import 'package:ubi_crm/core_widget/custom_field_component.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/sign_up_controller.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/widgets/personal_form_field_valication.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';
import 'package:get/get.dart';

class PersonalDataForm extends StatelessWidget {
  const PersonalDataForm({super.key});
  @override
  Widget build(BuildContext context) {
    return  personalDataFormWidget(Get.find<SignupController>(),context);
  }
}

Widget personalDataFormWidget(SignupController signupController, BuildContext context) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode fieldName = FocusNode();
  final FocusNode fieldCompany = FocusNode();
  final FocusNode fieldEmail = FocusNode();
  final FocusNode fieldNumber = FocusNode();
  final FocusNode fieldPwd = FocusNode();

    return Obx(()=>
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15), // Top padding
          RichText(
            text: TextSpan(
              style: AppTextStyle.extraHeading1B(),
              children: [
                TextSpan(
                  text: 'Surest_way_to_track'.tr,
                ),
                TextSpan(
                  text: 'Employees_Attendance'.tr,
                  style: AppTextStyle.extraHeading1B(
                      color: AppColor.primaryOriginalColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //1. Name Field
                FormFieldWithValidation(
                  focusNode: fieldName,
                  controller: signupController.userName,
                  hintText: 'Employee_Page_First_Name'.tr,
                  charCount: signupController.charCountName.value,
                  errorMessage: signupController.errorMessage.value,
                  errorBool: signupController.errorMessageBool.value,
                  maxLength: 40,
                  onFieldSubmit: (val) {
                    FocusScope.of(context).requestFocus(fieldCompany);
                  },
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'name can not be empty';
                    }
                    return null;
                  },

                ),

                //2. Company Name Field
                FormFieldWithValidation(
                  focusNode: fieldCompany,
                  controller:  signupController.companyName,
                  hintText: 'Enter_company_name'.tr,
                  charCount: signupController.charCountOrg.value,
                  errorMessage: signupController.companyErrorMessage.value,
                  errorBool: signupController.companyErrorBool.value,
                  maxLength: 40,
                  onFieldSubmit: (val) {
                    signupController.showField.value == true
                        ? FocusScope.of(context).requestFocus(fieldEmail)
                        : FocusScope.of(context).requestFocus(fieldNumber);
                  },
                  onChanged: (value) => signupController.companyFullName.value = value,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'company name can not be empty';
                    }
                    return null;
                  },
                ),

                //3. Email Field
                if (signupController.showField.value == true)
                  FormFieldWithValidation(
                    focusNode: fieldEmail,
                    controller: signupController.businessEmail,
                    hintText: 'Business_email'.tr,
                    charCount: signupController.charCountEmail.value,
                    errorMessage: signupController.emailErrorMessage.value,
                    errorBool: signupController.emailErrorBool.value,
                    maxLength: 40,
                    onFieldSubmit: (val) {
                      FocusScope.of(context).requestFocus(fieldPwd);
                    },
                    onChanged: (value) => signupController.companyFullName.value = value,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'email can not be empty';
                      }
                      return null;
                    },

                  ),

                //4. Phone Number
                if (signupController.showField.value == false)Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormFieldComponent(
                        focusNode: fieldNumber,
                        onFieldSubmit: (value) {
                          FocusScope.of(context).requestFocus(fieldPwd);
                        },
                        controller: signupController.phoneNumber,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        prefixIcon: Container(
                          padding: EdgeInsets.only(top:12.0, bottom: 8.5, left: 6),
                          child: CountryPicker(
                            callBackFunction: signupController.callBackFunction,
                            headerText: 'select_country'.tr,
                            headerBackgroundColor: AppColor.primaryOriginalColor,
                            headerTextColor: Colors.white,
                          ),
                        ),
                        hintText: 'enter_mobile_number'.tr,
                        underlineBorder: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      SizedBox(height: 2),
                      if (!signupController.numberErrorBool.value)
                        Text(
                          signupController.numberErrorMessage.value,
                          style: AppTextStyle.bodyText1SB(color: Colors.red),
                        ),
                    ],
                  ),

                //5. Password Field
                CustomFormFieldComponent(
                  obscureText: signupController.isObscure.value,
                  controller: signupController.passwordController,
                  hintText: 'Create_a_password'.tr,
                  underlineBorder: true,
                  suffixIcon: IconButton(
                    icon: Icon(signupController.isObscure.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                    onPressed: () => signupController.changeObSecure(),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'password can not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2),
                if (!signupController.passwordErrorBool.value)Text(
                    signupController.passwordErrorMessage.value,
                    style: AppTextStyle.bodyText1SB(color: Colors.red),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 35),

          //6. Next button
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.062,
              child: CustomButtonWidget(
                backgroundColor: AppColor.primaryOriginalColor,
                child: TextWidget(text: 'NextText'.tr),
                onPressed: () async {
                  if(!formKey.currentState!.validate()){
                    return;
                  }
                  signupController.showPage.value = 2;

                  NetworkUtils.checkInternetAndExecute(() async {
                    signupController.splitName();
                    await signupController.validateNameInput();
                    await signupController.companyNameValidation();
                    await signupController.validateEmail(signupController.businessEmail.text);
                    await signupController.signupPhoneValidation(signupController.phoneNumber.text);
                    await signupController.validatePassword();

                    if (signupController.errorMessageBool.value == true &&
                        signupController.companyErrorBool.value == true &&
                        signupController.emailErrorBool.value == true &&
                        signupController.numberErrorBool.value == true &&
                        signupController.passwordErrorBool.value == true) {
                      signupController.tempSignup();
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
}
