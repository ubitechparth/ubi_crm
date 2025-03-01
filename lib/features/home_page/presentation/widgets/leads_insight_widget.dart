import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core_widget/card_component.dart';
import 'package:ubi_crm/core_widget/custom_elevated_button_widget.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class LeadsInsightWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? count;
  final Widget? icon;
  final String? buttonText;
  final  Color? iconColor;
  final Function()? buttonOnTap;

  const LeadsInsightWidget(
      {super.key,
      this.title,
      this.subTitle,
      this.count,
      this.icon,
      this.buttonText,
      this.buttonOnTap,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      innerPadding: const EdgeInsets.all(8),
      outerPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            title ?? '',
            textAlign: TextAlign.start,
            style: AppTextStyle.heading1B(),
            maxLines: 2,

          ),
          Divider(color: Colors.grey.withOpacity(0.6)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Material(
                    color: AppColor.transparentColor,
                    child: icon,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    subTitle ?? '',
                    style: AppTextStyle.heading1SB(),
                  ),
                ],
              ),
              Text(
                count ?? '0',
                textAlign: TextAlign.start,
                style: AppTextStyle.heading2SB(color: AppColor.primaryOriginalColor),
                maxLines: 2,
              ),

              SizedBox(
                  width: Get.width * 0.25,
                  height: 30,
                  child: CustomButtonWidget(
                    child: TextWidget(
                      text: buttonText ?? 'view',
                    ),
                    onPressed: () async {
                      if (buttonOnTap != null) {
                        buttonOnTap!();
                      }
                    },
                  )),
            ],
          )
        ],
      ),
    );
  }
}
