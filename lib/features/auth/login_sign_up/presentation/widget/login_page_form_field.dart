import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/utils/Internet_network/network_handle.dart';
import 'package:ubi_crm/core_widget/country_picker2.dart';
import 'package:ubi_crm/core_widget/custom_elevated_button_widget.dart';
import 'package:ubi_crm/core_widget/custom_field_component.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/login_signup_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class LoginPageNumberField extends StatefulWidget {
  const LoginPageNumberField({super.key});
  @override
  State<LoginPageNumberField> createState() => _LoginPageNumberFieldState();
}

class _LoginPageNumberFieldState extends State<LoginPageNumberField> {
  @override
  Widget build(BuildContext context) {
    return buildLoginPageForm(Get.find<LoginSignupController>());
  }
}

Widget buildLoginPageForm(LoginSignupController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      children: [
        // WorldNo1TextWidget(),
        SizedBox(
          height: Get.height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Divider(color: Color(0xFFE2E2E2))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("login_or_Sign_Up".tr,
                  style: AppTextStyle.heading3B(color: Color(0XFF586377))),
            ),
            Expanded(child: Divider(color: Color(0xFFE2E2E2))),
          ],
        ),
        SizedBox(height: Get.height * 0.025),
        Form(
          child: Column(
            children: [
              Obx(() => Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.only(top: 8.5, bottom: 8.5, left: 6),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0XFFE6E9F0), width: 1.5),
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 6,
                                      color:
                                          Colors.black87.withValues(alpha: 0.1))
                                ]),
                            child: CountryPickerTwo(
                              callBackFunction: controller.callBackFunction,
                              headerText: 'select_country'.tr,
                              headerBackgroundColor:
                                  AppColor.primaryOriginalColor,
                              headerTextColor: AppColor.whiteOriginalColor,
                            ),
                          ),
                          SizedBox(width: Get.width * 0.03),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0XFFE6E9F0), width: 0.4),
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 0),
                                        blurRadius: 6,
                                        color: Colors.black87
                                            .withValues(alpha: 0.1))
                                  ]),
                              child: CustomFormFieldComponent(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 5),
                                color: Color(0XFFE6E9F0),
                                inputFormatters: <TextInputFormatter>[
                                  // LengthLimitingTextInputFormatter(15),
                                  FilteringTextInputFormatter.deny(' '),
                                  FilteringTextInputFormatter.deny(
                                      RegExp('[!.-]')),
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                hintText: 'enter_mobile_number'.tr,
                                controller: controller.mobileNumberController,
                                obscureText: false,
                                keyboardType: TextInputType.phone,
                                prefixIcon: Obx(() => Center(
                                      widthFactor: Get.width * 0.001,
                                      child: controller.dialCodeLoading.value ==
                                              true
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : Text(
                                              controller.countryCode,
                                              style: TextStyle(
                                                color: Color(0XFF1C1B1F),
                                                fontWeight: FontWeight.w600,
                                                fontSize: Get.width * 0.045,
                                              ),
                                            ),
                                    )),
                                textStyle: TextStyle(
                                  color: Color(0XFF1C1B1F),
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.width * 0.045,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (controller.showError.value == true)
                        Text("please_enter_mobile_number".tr,
                            style: AppTextStyle.bodyText1B(
                                color: AppColor.dangerColor)),
                      if (controller.showLengthError.value == true &&
                          controller.countryCode != '+91')
                        Text('7_digits'.tr,
                            style: AppTextStyle.bodyText1B(
                                color: AppColor.dangerColor)),
                      if (controller.showIndLengthError.value == true &&
                          controller.countryCode == '+91')
                        Text('10_digits'.tr,
                            style: AppTextStyle.bodyText1B(
                                color: AppColor.dangerColor))
                    ],
                  )),
              SizedBox(height: Get.height * 0.025),
              SizedBox(
                width: Get.width,
                height: Get.height * 0.06,
                child: CustomButtonWidget(
                  backgroundColor: AppColor.primaryOriginalColor,
                  onPressed: () async {
                    // Check internet connectivity before executing
                    NetworkUtils.checkInternetAndExecute(() async {
                      final String mobileNumber = controller.mobileNumberController.text;

                     /* if (mobileNumber.isEmpty) {
                        controller.showError.value = true;
                        return;
                      }

                      controller.showError.value = false;

                      // Handle country-specific mobile number length validations
                      if (controller.countryCode == '+91' && mobileNumber.length != 10) {
                        controller.showIndLengthError.value = true;
                        return;
                      }
                      else if (controller.countryCode != '+91' && mobileNumber.length < 7) {
                        controller.showLengthError.value = true;
                        return;
                      }

                      controller.showIndLengthError.value = false;
                      controller.showLengthError.value = false;
*/
                      // Proceed to check user existence
                      await controller.checkUserExistOrNot(mobileNumber, controller.countryCode);
                    });
                  },
                  child: TextWidget(text: 'continue_text'.tr, fontSize: Get.width * 0.045),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
