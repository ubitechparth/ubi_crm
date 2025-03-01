import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/features/addons_module/widgets/addons_card.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

//ignore: must_be_immutable
class SuggestedAddonsCard extends StatelessWidget {
  SuggestedAddonsCard({
    super.key,
    this.title,
    this.description,
    this.image,
    this.onPressed,
    this.videoUrl,
    this.name,
    this.sSts,
    this.event,
  });

  late String? title;
  late String? event;
  late String? description;
  late String? image;
  late void Function()? onPressed;
  late String? videoUrl;
  late String? name;   //do not edit this parameter by suraj
  late int ? sSts;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   AnalyticsService.logEvent('suggested_$event',{
      //     'page_name': 'addons_card',});
      //     },
      child: Container(
        decoration:  BoxDecoration(
            color: AppColor.whiteOriginalColor,
            boxShadow: [
              BoxShadow(
                color: AppColor.greyOriginalColor,
                blurRadius: 2.0,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(6))),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal:  16,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: GestureDetector(
                onTap: (){ launchMap(videoUrl!);},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.play_circle,
                      color:AppColor.primaryOriginalColor,
                      size: 20,
                    ),
                    Text(
                      'learnMoreText'.tr,
                      textScaler: const TextScaler.linear(1),
                      style: AppTextStyle.heading2B(underLine: true,color: AppColor.primaryOriginalColor),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              margin: EdgeInsets.only(bottom: 5),
              child: SvgPicture.asset(
                image!,
                fit: BoxFit.fill,
              ),
            ),
            Text(title!,
                textScaler: const TextScaler.linear(1),
                style: AppTextStyle.heading1B()),

            SizedBox(
              width: double.infinity,
              child: Text(description??'',
                  textScaler: const TextScaler.linear(1),
                  style: AppTextStyle.bodyText4SB()),
            ),
            Container(

              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      // tryFreeModule(name);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'try_free'.tr,
                          textScaler: const TextScaler.linear(1),
                          style: AppTextStyle.heading2B(underLine: true,color: AppColor.primaryOriginalColor),
                        ),

                      ],
                    ),
                  ),


                  GestureDetector(
                    onTap: (){  // ScheduleDemo scheduleDemo = ScheduleDemo();
                  // scheduleDemo.getScheduleDemo("payRoll");
                  },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'bookDemo'.tr,
                          textScaler: const TextScaler.linear(1),
                          style: AppTextStyle.heading2B(underLine: true,color: AppColor.primaryOriginalColor),
                        ),

                      ],
                    ),
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}