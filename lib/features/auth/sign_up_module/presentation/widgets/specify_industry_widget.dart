import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubi_crm/core_widget/custom_elevated_button_widget.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/sign_up_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';
import 'package:get/get.dart';

class ChooseIndustryWidget extends StatelessWidget {
  const ChooseIndustryWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  buildSpecifyIndustryWidget(Get.find<SignupController>(),context);
  }
}


Widget buildSpecifyIndustryWidget(SignupController signupController, BuildContext context) {
  return SizedBox(
    height:Get.height*0.8,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'What_is_your_business_industry'.tr,
              style: AppTextStyle.extraHeading1B(),
            ),
            const SizedBox(height: 12),
            SizedBox(
              // color: Colors.red,
              height: Get.height * 0.65,
              child: ScrollConfiguration(
                behavior: NoScrollBehavior(),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 2.2, // Square tiles
                  ),
                  itemCount: signupController.industry
                      .length, // Adding 1 for the "Other Industries" button
                  itemBuilder: (context, index) {
                    return Obx(() => GestureDetector(
                      onTap: () {
                        signupController.selectIndustry =
                            signupController.industry[index]['title'].toString();

                        signupController.industryIndex(index);
                        signupController.showPage.value = 5;
                      },
                      child: Container(
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: signupController.selectedIndustryIndex.value ==
                                index
                                ? const Color(0xFFD8FFF5)
                                : Colors.white,
                            border: Border.all(
                              color:
                              signupController.selectedIndustryIndex.value ==
                                  index
                                  ? const Color(0xFF007E5F)
                                  : Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 6,
                                  color:
                                  Colors.black87.withValues(alpha: 0.1))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              signupController.industry[index]['icon']!,
                              colorFilter: ColorFilter.mode(
                                AppColor.primaryOriginalColor, BlendMode.srcIn,
                              ), // ✅ Correct approach

                              width: 35,
                              height: 35,
                            ),

                            const SizedBox(height: 8.0),
                            Text(signupController.industry[index]['title']!,
                                style: AppTextStyle.bodyText3SB()),
                          ],
                        ),
                      ),
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
     SizedBox(
       width: Get.width,
       child: CustomButtonWidget(
         child: TextWidget(text: 'Next'),
         onPressed: (){
           signupController.industryIndex(-1);
           signupController.showPage.value = 5;
         },
       ),
     ),
      ],
    ),
  );

}
class NoScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}