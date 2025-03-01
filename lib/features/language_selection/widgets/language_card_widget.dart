import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/features/language_selection/controller/language_selection_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class LanguageCardWidget extends StatelessWidget {
  final int index;
  const LanguageCardWidget({super.key,required this.index});
  @override
  Widget build(BuildContext context) {
    return _buildLanguageCard(Get.find<LanguageSelectionController>(),index);
  }
}

/// Builds each language selection card
Widget _buildLanguageCard(LanguageSelectionController controller, int index) {
  final language = controller.languageCardList[index];
  final isSelected = controller.selectedIndex.value == index;
  return Padding(
    key: ValueKey(language.hashCode),
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    child: InkWell(
      onTap: () => controller.selectLanguage(index),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColor.primaryOriginalColor : AppColor.grayNeutralColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: Text(
                language.languageTitle ?? '',
                style: AppTextStyle.extraHeading4FB(
                    color: AppColor.whiteOriginalColor),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  language.illustration ?? '',
                  fit: BoxFit.scaleDown,
                  scale: 1.3,
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}