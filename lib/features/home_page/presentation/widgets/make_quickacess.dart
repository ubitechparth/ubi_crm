import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubi_crm/core_widget/card_component.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';
import 'package:get/get.dart';

Widget makeDashboardItem(homeController,String title, onCardTap, imageName, onPlayButtonTap) {
  return CardComponent(
      innerPadding: const EdgeInsets.all(5),
      outerPadding: const EdgeInsets.only(right: 6),
      borderColor: AppColor.grayNeutralColor,
      borderRadius: 5,
      child: SizedBox(
        width: Get.width*0.21,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.height*0.07,
                height: Get.height*0.07,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primaryOriginalColor.withOpacity(0.1),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    imageName,
                    fit: BoxFit.contain,
                    height: 25,
                  ),
                ),
              ),
              Text(
                  title,
                  textAlign: TextAlign.center,
                textScaler: TextScaler.linear(1),
                style: AppTextStyle.bodyText5SB(fontSize: Get.width * 0.0315),
                ),
              const SizedBox()
            ]),
      ));
}


