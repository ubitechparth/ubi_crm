import 'package:flutter/material.dart';
import 'package:ubi_crm/core_widget/custom_elevated_button_widget.dart';
import 'package:ubi_crm/core_widget/custome_drop_down.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/sign_up_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';
import 'package:get/get.dart';

class YourRolesWidget extends StatelessWidget {
  const YourRolesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  buildYourRolesWidget(Get.find<SignupController>(),context);
  }
}


Widget buildYourRolesWidget(SignupController signupController, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10), // Top padding
      Text(
        '${'What_your_role_in'.tr}${signupController.companyName.text}',
        style: AppTextStyle.extraHeading1B(),
      ),
      const SizedBox(height: 20),
      Form(
          child: Column(
            children: [
              CustomDropDownField(
                hintText: 'Your Role',
                label: '',
                onChanged: (value){
                },
                itemList: signupController.rolesList,
                getItemLabel: ( item) => item.toString(),
              )
            ],
          )),
      const SizedBox(height: 50),
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: Get.width,
          height: Get.height * 0.062,
          child: CustomButtonWidget(
            backgroundColor: AppColor.primaryOriginalColor,
            child: TextWidget(
              text: 'NextText'.tr,
            ),
            onPressed: () async {
              // var validate = formKey.currentState!.validate();
              // if(validate){
              signupController.showPage.value = 3;
              // }
            },
          ),
        ),
      ),
    ],
  );

}
