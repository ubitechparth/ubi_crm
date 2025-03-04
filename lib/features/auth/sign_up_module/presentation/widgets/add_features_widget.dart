import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/core/utils/Internet_network/network_handle.dart';
import 'package:ubi_crm/core_widget/custom_elevated_button_widget.dart';
import 'package:ubi_crm/core_widget/snack_bar_widget.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/sign_up_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';
import 'package:get/get.dart';

class AddFeaturesWidget extends StatelessWidget {
  const AddFeaturesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  buildAddFeaturesWidget(Get.find<SignupController>(),context);
  }
}


Widget buildAddFeaturesWidget(SignupController signupController, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10), // Padding at the top
      Text(
        "let_add_features_your_app".tr,
        style: AppTextStyle.extraHeading1B(),
      ),
      const SizedBox(height: 10),
      Column(
        children: [
          _buildFeatureTile(context, 'Attendance', AppAssets.svg.att,
              AppColor.primaryLighterColor, signupController.featureAttendance),
          _buildFeatureTile(context, 'Leave', AppAssets.svg.lea,
              AppColor.primaryLighterColor, signupController.featureLeave),
          _buildFeatureTile(context, 'Payroll', AppAssets.svg.pay,
              AppColor.primaryLighterColor, signupController.featurePayroll),
          _buildFeatureTile(context, 'Visit', AppAssets.svg.vi,
              AppColor.primaryLighterColor, signupController.featureVisit),
          _buildFeatureTile(context, 'Timesheet', AppAssets.svg.ts,
              AppColor.primaryLighterColor, signupController.featureTimesheet),
        ],
      ),
      const SizedBox(height: 30),
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: Get.width,
          height: Get.height * 0.062,
          child: CustomButtonWidget(
            backgroundColor: AppColor.primaryOriginalColor,
            child: TextWidget(
              text: "Let_go".tr,
            ),
            onPressed: () async {

  NetworkUtils.checkInternetAndExecute(() async {
                bool anyFeatureEnabled = [
                  signupController.featureAttendance,
                  signupController.featureLeave,
                  signupController.featurePayroll,
                  signupController.featureVisit,
                  signupController.featureTimesheet
                ].any((feature) => feature.value);
                if (!anyFeatureEnabled) {
                  SnackBarWidget().warningMsg(message: 'select_atleast_one_feature'.tr);
                } else {
                  //   globals.newSignUp.value = true;
                  //// handle api
                  // controller.checkLogin();
                }
              });
            },
          ),
        ),
      )
    ],
  );

}
Widget _buildFeatureTile(BuildContext context, String title, String icon,
    Color color, RxBool value) {
  return Obx(
        () => Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: () {
          value.toggle();
        },
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: value.value ? color : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: value.value
                  ? Border.all(color: AppColor.primaryOriginalColor, width: 1)
                  : null,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 6,
                    color: Colors.black87.withValues(alpha: 0.1))
              ]),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: AppTextStyle.bodyText5SB(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}