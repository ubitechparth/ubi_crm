import 'package:flutter/material.dart';
import 'package:ubi_crm/features/auth/sign_up_module/controller/sign_up_controller.dart';
import 'package:ubi_crm/theme/text_style.dart';
import 'package:get/get.dart';

class NumberOfEmployeeWidget extends StatelessWidget {
  const NumberOfEmployeeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  buildNumberOfEmployeeWidget(Get.find<SignupController>(),context);
  }
}


Widget buildNumberOfEmployeeWidget(SignupController signupController, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      Text(
        'How_many_employees_do_you_have'.tr,
        style: AppTextStyle.extraHeading1B(),
      ),
      SizedBox(
        height: 350,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 2.5,
          ),
          itemCount: signupController.options.length,
          itemBuilder: (context, index) {
            return Obx(
                  () => GestureDetector(
                onTap: () {
                  signupController.selectEmpNo = signupController.options[index];
                  signupController.empIndex(index);
                  signupController.showPage.value = 4;
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: signupController.selectedIndex.value == index
                          ? const Color(0xFFD8FFF5)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: signupController.selectedIndex.value == index
                            ? const Color(0xFF007E5F)
                            : Colors.white,
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 6,
                            color: Colors.black87.withValues(alpha: 0.1))
                      ]),
                  child: Center(
                    child: Text(
                      signupController.options[index],
                      style: TextStyle(
                        color: signupController.selectedIndex.value == index
                            ? const Color(0xFF727272)
                            : Colors.grey,
                        fontWeight: signupController.selectedIndex.value == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );

}
