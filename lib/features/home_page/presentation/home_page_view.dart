import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/core/custom_appbar.dart';
import 'package:ubi_crm/core/routes/route_constant.dart';
import 'package:ubi_crm/core_widget/card_component.dart';
import 'package:ubi_crm/core_widget/custom_glow_remover.dart';
import 'package:ubi_crm/core_widget/drawer.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';
import 'package:ubi_crm/features/home_page/presentation/home_page_controller.dart';
import 'package:ubi_crm/features/home_page/presentation/widgets/leads_insight_widget.dart';
import 'package:ubi_crm/features/home_page/presentation/widgets/make_quickacess.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class HomePageView extends GetView<HomePageController>{
   HomePageView({super.key});
 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: AppTextStyle.appBarText( "Ubitech Solutions Pvt Ltd"),
        leading: IconButton(
            icon:  Icon(Icons.menu,color: AppColor.whiteOriginalColor,),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            }),
        
      ),
      drawer: getAppDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Quick Access Card
            CardComponent(
              innerPadding: const EdgeInsets.all(8),
              outerPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'home_quick_access'.tr,
                    style: AppTextStyle.heading1B(),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: Get.height*0.16,   //Quick Access card length height
                    child: ScrollGlowRemover(
                      child: ListView.builder(
                        itemCount: controller.quickAccessCardList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return makeDashboardItem(
                            controller,
                            controller.quickAccessCardList[index].title,
                            controller.quickAccessCardList[index].onTap,
                            controller.quickAccessCardList[index].image,
                            controller.quickAccessCardList[index].onPlayButtonTap,);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),

            //Leads Insight
            LeadsInsightWidget(
              title: 'Leads Insight',
              subTitle: "Leads Today",
              icon: AppIcons.calendarMonthIcon(color: AppColor.primaryOriginalColor),
              count: '15',
              buttonText: 'home_Present_TodayView'.tr,
              buttonOnTap: () {
                Get.toNamed(RouteConstant.leadView);
              },
            ),

            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.7,
                enableInfiniteScroll: true,
                autoPlay: true,
                height: Get.height*0.25
              ),
              items: [
                Image.asset(AppAssets.image.referEarnCard),
                Image.asset(AppAssets.image.empTrackingCard),
              ],
            )
          ],
        ),
      ),
    );
  }
}