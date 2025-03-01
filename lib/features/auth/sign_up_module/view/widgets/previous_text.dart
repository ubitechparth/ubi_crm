import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/features/auth/sign_up_module/controller/sign_up_controller.dart';
import 'package:ubi_crm/theme/text_style.dart';

class PreviousButtonWidget extends StatelessWidget {
  final SignupController controller;

  const PreviousButtonWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
          onPressed: () {
            if (controller.showPage.value == 1) {
              Get.back();
              Future.delayed(const Duration(milliseconds: 500));
                controller.clearForm();
            } else {
              controller.showPage.value--;
            }
          },
          icon: Icon(Icons.arrow_back, color: Colors.grey[700], size: 16),
          label: Text('PreviousText'.tr, style: AppTextStyle.bodyText4SB()),
        ),
      ),
    );
  }
}