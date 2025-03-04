import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/sign_up_controller.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/widgets/add_features_widget.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/widgets/number_of_employee_widget.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/widgets/personal_form_widget.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/widgets/previous_text.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/widgets/progress_indicator.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/widgets/specify_industry_widget.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/widgets/your_roles_widget.dart';

class SignupViewPage extends GetView<SignupController> {
  const SignupViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 45),
            ProgressIndicatorWidget(controller: controller),
            if (controller.showPage.value != 1) const SizedBox(height: 6),
            if (controller.showPage.value != 2)PreviousButtonWidget(controller: controller),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: getPageContent(context),
            )
          ],
        )
    );
  }

  Widget getPageContent(context) {
    final pages = {
      1: PersonalDataForm(),
      2: YourRolesWidget(),
      3: NumberOfEmployeeWidget(),
      4: ChooseIndustryWidget(),
      5: AddFeaturesWidget(),
    };

    return Obx(() => pages[controller.showPage.value] ?? const SizedBox());
  }
}
