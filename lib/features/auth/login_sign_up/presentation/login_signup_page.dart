import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/login_signup_controller.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/widget/google_apple_button_widget.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/widget/login_page_form_field.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/widget/login_page_header.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/widget/login_sign_up_term_condition.dart';

class LoginSignupPage extends GetView<LoginSignupController> {
  const LoginSignupPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Column(
                children: [
                  LoginPageHeader(),
                  SizedBox(
                    height: Get.height * 0.028,
                  ),
                  LoginPageNumberField(),
                ],
              ),
              Get.height > 718
                  ? Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context)
                                  .viewInsets
                                  .collapsedSize
                                  .height *
                              0.0001))
                  : Get.height < 718
                      ? Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context)
                                      .viewInsets
                                      .collapsedSize
                                      .height *
                                  0.3))
                      : Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context)
                                      .viewInsets
                                      .collapsedSize
                                      .height *
                                  0.2)),
              SizedBox(
                height: Get.height * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GoogleMicroSoftButtonWidget(),
                    LoginTermsAndPrivacyWidget(
                      onTermTap: controller.launchTermURL,
                      onPrivacyTap: controller.launchPrivacyURL,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
