import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/custom_appbar.dart';
import 'package:ubi_crm/core_widget/cancel_button_widget.dart';
import 'package:ubi_crm/core_widget/custom_elevated_button_widget.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

// ignore: must_be_immutable
class PremiumFeaturesPage extends StatelessWidget {
  PremiumFeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController firstController = ScrollController();
    return Scaffold(
      backgroundColor: AppColor.whiteOriginalColor,
      appBar: CustomAppBar(
         title: AppTextStyle.appBarText('features_text'.tr),
        leading: AppIcons.arrowBackIcon(color: AppColor.whiteOriginalColor),
      ),
      body: Container(
        height: Get.height * 0.9,
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: Get.height * 0.7,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Scrollbar(
                      thickness: 4,
                      radius: const Radius.circular(15),
                      thumbVisibility: true,
                      trackVisibility: true,
                      interactive: true,
                      controller: firstController,
                      child: ListView.builder(
                          controller: firstController,
                          itemCount: premiumText.length,
                          itemBuilder: (BuildContext context, index) {
                            return premiumText[index] == 'Leads' || premiumText[index] == 'Customers' || premiumText[index] == 'Users' || premiumText[index] =='Products' || premiumText[index] =='Sales'
                                ? Container(
                              margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${premiumText[index]}",
                                          style: AppTextStyle.heading3B(),
                                        ),
                                      ],
                                    ),
                                )
                                : Text(
                                  "${premiumText[index]}",
                                  style: AppTextStyle.bodyText5M(),
                                );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CancelButtonWidget(
                  onPressed: () {
                    if (Platform.isAndroid) {
                    //  whatApp.whatsAppForPremiumFeature();
                    } else {
                      //whatApp.whatsAppIos();
                    }
                  },
                  child: TextWidget(
                    text: "Talk to Sales",
                    textColor: AppColor.primaryOriginalColor,

                  ),
                ),
                SizedBox(width: 10,),
                CustomButtonWidget(
                  onPressed: () async {
                  //  Get.offNamedUntil(RouteConstant.payment, (route) => route.settings.name == RouteConstant.payment);
                  },
                  child: TextWidget(
                    text: "Buy",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List premiumText = [
    'Leads',
    'Leads data',
    'Capture website Inquiries',
    'Manage Inquiries',
    'Import Inquiries',
    'Lead assignment',
    'Lead stages',
    'Face Location Detection',
    'Rate Leads',
    'Lead Activity',
    'Leads History', //Lead end
    'Customers',
    'Manage Customers', //Customer End
    'Users',
    'Users Management',
    'User Permissions',
    'Products',
    'Manage Products',
    'Sales',
    'Manage sales',
    'Sales Team',
  ];
}
