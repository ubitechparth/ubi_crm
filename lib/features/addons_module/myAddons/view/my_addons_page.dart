import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/core_widget/custom_glow_remover.dart';
import 'package:ubi_crm/core_widget/loader.dart';
import 'package:ubi_crm/features/addons_module/myAddons/controller/my_addons_controller.dart';
import 'package:ubi_crm/features/addons_module/myAddons/view/widgets/my_addons_card.dart';
import 'package:ubi_crm/theme/text_style.dart';

class MyAddonsPage extends GetView<MyAddonsController> {
  const MyAddonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value == true
          ? const SizedBox(
              child: Center(
                child: Loader2(),
              ),
            )
          : controller.myAddonCard.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Lottie.asset(
                        AppAssets.json.addonNotFound,
                        width: 400,
                        height: 400,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        "Addon_not_available".tr,
                          style: AppTextStyle.heading3SB()
                      )
                    ],
                  ),
                )
              : ScrollGlowRemover(
                  child: GridView.builder(
                    itemCount: controller.myAddonCard.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 12.0,

                        ),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    itemBuilder: (BuildContext context, int index) {
                      return MyAddonsCard(
                        image: controller.myAddonCard[index].image,
                        title: controller.myAddonCard[index].text,
                        videoUrl: controller.myAddonCard[index].url,
                        onTap: controller.myAddonCard[index].onTap,
                        sSts: controller.myAddonCard[index].sSts,
                        event: controller.myAddonCard[index].event,

                      );
                    },
                  ),
                ),
    );
  }
}
