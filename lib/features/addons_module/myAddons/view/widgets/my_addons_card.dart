import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubi_crm/features/addons_module/widgets/addons_card.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class MyAddonsCard extends StatelessWidget       {
  const MyAddonsCard({
    super.key,
    this.title,
    this.image,
    this.videoUrl,
    this.onTap,
    this.name,  //do not edit this parameter by suraj
    this.sSts,
    this.event
  });

  final String? event;
  final String? title;
  final String? image;
  final String? videoUrl;
  final void Function()? onTap;
  final String? name;  //do not edit this parameter by suraj
  final int? sSts;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();}
      },child: Container(
      decoration:  BoxDecoration(
          color: AppColor.whiteOriginalColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.greyOriginalColor,
              blurRadius: 0.1,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset(
                    image!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(title!,
                  textScaler: const TextScaler.linear(1),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.heading1B()),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                onPressed: () {
                  launchMap(videoUrl!);
                },
                icon:  Icon(
                  Icons.play_circle,
                  color: AppColor.primaryOriginalColor,
                )
              //tooltip: 'learnHowItWorksText'.tr,
            ),
          )
        ],
      ),
    ),
    );
  }
}