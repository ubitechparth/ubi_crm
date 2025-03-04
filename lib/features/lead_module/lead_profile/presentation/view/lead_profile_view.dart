import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/core/custom_appbar.dart';
import 'package:ubi_crm/core_widget/buil_pop_up_menu_button.dart';
import 'package:ubi_crm/core_widget/custom_popup_button.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';
import 'package:ubi_crm/core_widget/rating_bar.dart';
import 'package:ubi_crm/features/lead_module/lead_profile/presentation/controller/lead_profile_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class LeadProfileView extends GetView<LeadProfileController> {
  const LeadProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteOriginalColor,
      appBar: CustomAppBar(
        title: AppTextStyle.appBarText('Ubitech pvt ldt'),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: AppIcons.arrowBackIcon(color: AppColor.whiteOriginalColor)),
        actions: [
          CustomPopUpMenuButton(
            iconColor: AppColor.whiteOriginalColor,
            itemBuilder: (BuildContext context) {
              return [
                BuildPopUpMenuButton(
                    text: 'Edit', onTap: () {}, icon: AppIcons().editOutline),
              ];
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primaryOriginalColor
                          .withOpacity(0.2), // Shadow color
                      spreadRadius: 0, // Spread radius
                      blurRadius: 6, // Blur effect
                      offset: Offset(0, 4), // Only bottom shadow (x=0, y=4)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppAssets.svg.phoneImage),
                  SvgPicture.asset(AppAssets.svg.emailImage),
                  SvgPicture.asset(AppAssets.svg.gMeetImage),
                  SvgPicture.asset(AppAssets.svg.whatsappImage),
                  SvgPicture.asset(AppAssets.svg.fileTextImage),
                  SvgPicture.asset(AppAssets.svg.mapPinImage),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Regendra Suman",
                            style: AppTextStyle.bodyText6B(
                                color: AppColor.primaryDarkColor),
                          ),
                          Text(
                            "regendrasuman@ubitechsolutions.com",
                            style: AppTextStyle.bodyText4M(
                                color: AppColor.grayDarkerColor),
                          ),
                          Text(
                            "7566790833",
                            style: AppTextStyle.bodyText4M(
                                color: AppColor.grayDarkerColor),
                          ),
                          Text(
                            "Attendance, Payroll, Leave",
                            style: AppTextStyle.bodyText4M(
                                color: AppColor.grayDarkerColor),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 30, // Adjust size
                        backgroundImage: AssetImage('assets/Rohit_Sharma.jpg'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            initialRating: 3.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) async {},
                            itemSize: 23,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          LinearPercentIndicator(
                            width: Get.width * 0.65,
                            lineHeight: 10.0,
                            percent: 0.75,
                            backgroundColor: AppColor.grayNeutralColor,
                            barRadius: Radius.circular(25),
                            linearGradient: AppColor.primaryGradientColor,
                            padding: EdgeInsets.zero,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "75%",
                            style: AppTextStyle.bodyText6B(),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lead Owner",
                  style: AppTextStyle.bodyText6B(),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  color: AppColor.whiteOriginalColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15, // Adjust size
                                  backgroundImage:
                                      AssetImage('assets/Rohit_Sharma.jpg'),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "Regendra Suman",
                                  style: AppTextStyle.bodyText6B(),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: AppColor.grayLightGreyColor,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.svg.fileTextImage,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Notes",
                                    style: AppTextStyle.bodyText5B(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'High chances of getting finallized. Good Client 😀 ',
                          style: AppTextStyle.bodyText4SB(
                              color: AppColor.grayDarkerColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
