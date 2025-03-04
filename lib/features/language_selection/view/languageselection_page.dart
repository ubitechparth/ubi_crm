import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/custom_appbar.dart';
import 'package:ubi_crm/core_widget/custom_elevated_button_widget.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/features/language_selection/controller/language_selection_controller.dart';
import 'package:ubi_crm/features/language_selection/widgets/language_card_widget.dart';
import 'package:ubi_crm/theme/text_style.dart';

class LanguageSelectionPage extends GetView<LanguageSelectionController> {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        padding: EdgeInsets.only(left: 10),
        title: AppTextStyle.appBarText("on_select_language".tr),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(4.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 200 / 120,
          ),
          itemCount: controller.languageCardList.length,
          itemBuilder: (context, index) {
            return LanguageCardWidget(index: index);
          },
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12),
        height: Get.height*0.065,
        child: CustomButtonWidget(
          onPressed: controller.moveToNextScreen,
          child: TextWidget(text: "continue_text".tr,),
        ),
      ),
    );
  }
}
