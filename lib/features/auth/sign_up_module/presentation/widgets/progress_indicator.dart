// Reusable Widgets

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/features/auth/sign_up_module/presentation/sign_up_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final SignupController controller;

  const ProgressIndicatorWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
        child: controller.showPage.value == 1
            ? const SizedBox()
            : ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            final isCompleted = (controller.showPage.value - 2) >= index;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: Get.width * 0.23,
              decoration: BoxDecoration(
                color: isCompleted ? AppColor.primaryOriginalColor : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          },
        ),
      ),
    );
  }
}
