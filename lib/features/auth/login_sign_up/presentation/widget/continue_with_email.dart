import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/core/utils/Internet_network/network_handle.dart';
import 'package:ubi_crm/core/utils/validator.dart';
import 'package:ubi_crm/core_widget/cancel_button_widget.dart';
import 'package:ubi_crm/core_widget/custom_elevated_button_widget.dart';
import 'package:ubi_crm/core_widget/custom_field_component.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/login_signup_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class ContinueWithEmail extends StatelessWidget {
  const ContinueWithEmail({super.key});
  @override
  Widget build(BuildContext context) {
    return buildLoginPageForm(Get.find<LoginSignupController>());
  }
}

Widget buildLoginPageForm(LoginSignupController controller) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  return PopScope(
    canPop: true,
    onPopInvokedWithResult: (didPop, dynamic) {
      controller.emailController.clear();
    },
    child: Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Image.asset(
                AppAssets.image.ubiSalesLog,
                width: 80,
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Continue_with_Email".tr,
                      style: AppTextStyle.extraHeading5B(),
                    ),
                    SizedBox(height: Get.height * 0.08),
                    Text(
                      'Type_your_email_here'.tr,
                      style: AppTextStyle.bodyText5B(),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomFormFieldComponent(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(40),
                            ],
                            hintText: "Enter_your_email".tr,
                            underlineBorder: true,
                            suffix: Obx(() => Text(
                                  '${controller.charCountEmail.value}/40', // Display the character count
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                )),
                            validator: (value) {
                              return Validator.emailValidation(value!);
                            },
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CancelButtonWidget(
                            onPressed: () {
                              controller.emailController.clear();
                              Get.back();
                            },
                            buttonBorderColor: AppColor.primaryOriginalColor,
                            child: TextWidget(
                              text: "backText".tr,
                              textColor: AppColor.primaryOriginalColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: CustomButtonWidget(
                            backgroundColor: AppColor.primaryOriginalColor,
                            onPressed: () {
                              NetworkUtils.checkInternetAndExecute(() {
                                bool validate = formKey.currentState!.validate();
                                if (validate) {
                                  controller.checkUserExistOrNot(controller.emailController.text,'');
                                }
                              });
                            },
                            child: TextWidget(text: "done_text".tr),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
