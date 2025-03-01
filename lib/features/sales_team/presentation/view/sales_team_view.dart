import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/custom_appbar.dart';
import 'package:ubi_crm/core_widget/buil_pop_up_menu_button.dart';
import 'package:ubi_crm/core_widget/custom_popup_button.dart';
import 'package:ubi_crm/core_widget/drawer.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';
import 'package:ubi_crm/core_widget/list_tile_widget.dart';
import 'package:ubi_crm/features/sales_team/presentation/controller/sales_team_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class SalesTeamView extends GetView<SalesTeamController>{
   const SalesTeamView({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: CustomAppBar(
        title: AppTextStyle.appBarText( "Ubitech Solutions"),
        leading: IconButton(
            icon:  AppIcons.arrowBackIcon(color: AppColor.whiteOriginalColor,),
            onPressed: () {
Get.back();
            }),),
      drawer: getAppDrawer(context),
body: Column(
  children: [
    Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("Team",style: AppTextStyle.heading3B(),),
              SizedBox(width: 6,),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.primaryOriginalColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(4)
                ),
                padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                child: Row(
                  children: [
                    AppIcons.calendarMonthIcon(color: AppColor.primaryOriginalColor,size: 20  ),
                    SizedBox(width: 7,),
                    Text("Today",style: AppTextStyle.bodyText4B(color: AppColor.primaryOriginalColor),)
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              AppIcons.searchIcon(),
              SizedBox(width: 15,),
            ],
          ),
        ],
      ),
    ),
    Divider(),
    SizedBox(
      height: Get.height*0.78,
      width: Get.width,
      child: ListView.builder(
          itemCount: 20,
          itemBuilder:(BuildContext context, int index){
            return CustomListTileWidget(
                icon: CircleAvatar(
                  radius: 20, // Adjust size
                  backgroundImage: AssetImage('assets/Rohit_Sharma.jpg'),
                ),
              title: 'Regendra Suman',
                titleStyle: AppTextStyle.bodyText6B(),
                onTap: (){},
              subtitle: 'Deal Amount: \$40',
              subTitleStyle: AppTextStyle.bodyText4B(),
              trailingIcon:  CustomPopUpMenuButton(
                iconColor: AppColor.blackLighterColor,
                itemBuilder: (BuildContext context) {
                  return [
                    BuildPopUpMenuButton(text: 'Edit', onTap: () {}, icon: AppIcons().editOutline),
                  ];
                },
              ),
            );
          }),
    )
  ],
),
    );
  }
}