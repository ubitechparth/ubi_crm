import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core_widget/custom_glow_remover.dart';
import 'package:ubi_crm/core_widget/loader.dart';
import 'package:ubi_crm/features/addons_module/myAddons/controller/my_addons_controller.dart';
import 'package:ubi_crm/features/addons_module/suggestedAddons/controller/suggested_addons_controller.dart';
import 'package:ubi_crm/features/addons_module/suggestedAddons/view/widgets/suggested_addons_card.dart';
import 'package:ubi_crm/theme/text_style.dart';

class SuggestedAddonsPage extends GetView<SuggestedAddonsController> {
  final addonsController = Get.find<MyAddonsController>();

   SuggestedAddonsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(()=> addonsController.isLoading.value==true
        ? const SizedBox(
          child: Center(
            child: Loader2(),
          ),
        ):addonsController.suggestedAddonCard.isEmpty?Center(
          child: Text(
            "Addon_SuggestedNot_available".tr,
            style: AppTextStyle.heading3SB()
          ),
        )
        :ScrollGlowRemover(
          child: ListView.builder(
          itemCount: addonsController.suggestedAddonCard.length,

          itemBuilder: (BuildContext context, int index) {
            return SuggestedAddonsCard(
              image: addonsController.suggestedAddonCard[index].image,
              title: addonsController.suggestedAddonCard[index].text,
              description: addonsController.suggestedAddonCard[index].description,
              videoUrl: addonsController.suggestedAddonCard[index].url,
              name: addonsController.suggestedAddonCard[index].name,
              sSts: addonsController.suggestedAddonCard[index].sSts,
              event: addonsController.suggestedAddonCard[index].event,
              onPressed: () {},
            );
          },
                ),
        ),
    );
  }
}
