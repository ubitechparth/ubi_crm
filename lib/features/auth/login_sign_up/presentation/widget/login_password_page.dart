import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/core/globals.dart';
import 'package:ubi_crm/core/utils/Internet_network/network_handle.dart';
import 'package:ubi_crm/core_widget/cancel_button_widget.dart';
import 'package:ubi_crm/core_widget/custom_elevated_button_widget.dart';
import 'package:ubi_crm/core_widget/custom_field_component.dart';
import 'package:ubi_crm/core_widget/snack_bar_widget.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/login_signup_controller.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/widget/login_sign_up_term_condition.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

//ignore: must_be_immutable
class LoginPasswordPage extends GetView<LoginSignupController>{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.grey.withValues(alpha: 0.01),
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 12),
            child:  Image.asset(UbiSalesLogo().ubiSalesLogo),
        )
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("enter_your_password".tr,
                      style: AppTextStyle.extraHeading5B(),),
                    SizedBox(height: Get.height*0.08), // Spacing between texts
                    Text(
                      'Type_your_password_here'.tr,
                      style: AppTextStyle.bodyText5B(),
                    ),
                    SizedBox(height: Get.height*0.01),
                    Form(
                        key: formKey,
                        child:Obx(()=>
                            CustomFormFieldComponent(
                              underlineBorder: true,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'onSignUpWithOtpVerifyPasswordRequired'.tr;
                                }
                                return null;
                              },
                              obscureText: controller.isObscure.value,
                              controller: controller.password,
                              hintText: 'password_text'.tr,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isObscure.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  color: Colors.black54,
                                ),
                                onPressed: () {
                                  controller.changeObSecure();
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 15),
                            ),
                         )
                    ),
                    SizedBox(height: Get.height*0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () async {
                            if(isNetworkAvailable.value == true) {
                              // Get.toNamed(RouteConstant.forgotPasswordPage);
                            }
                            else{
                              SnackBarWidget().alertMsg("NoInternetText".tr);
                            }
                          },
                          child: Text(
                            'forgot_password'.tr,
                            style: AppTextStyle.bodyText5B(color: AppColor.primaryOriginalColor),
                            textScaler: const TextScaler.linear(1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height*0.1),
                    Row(
                      children: [
                        Expanded(
                          child: CancelButtonWidget(buttonBorderColor: AppColor.primaryOriginalColor ,
                            child: TextWidget(text: "backText".tr,
                              textColor: AppColor.primaryOriginalColor
                            ),

                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: CustomButtonWidget(
                            backgroundColor: AppColor.primaryOriginalColor,
                            child: TextWidget(text: 'done_text'.tr),
                            onPressed: () async {
                              NetworkUtils.checkInternetAndExecute(() async {
                                bool validate = formKey.currentState!.validate();
                                if(validate){
                                  controller.loginAPI();
                                }
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                Get.height>718
                    ? Padding(padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.collapsedSize.height*0.0001))
                    : Get.height<718
                    ? Padding(padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.collapsedSize.height*0.12))
                    : Padding(padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.collapsedSize.height*0.2)),

                Container(
                  height: Get.height*0.05,
                  margin: EdgeInsets.only(
                    top: Get.height>718? Get.height*0.4 : Get.height*0.32
                  ),
                  child: LoginTermsAndPrivacyWidget(
                    onTermTap:controller.launchTermURL,
                    onPrivacyTap: controller.launchPrivacyURL,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




