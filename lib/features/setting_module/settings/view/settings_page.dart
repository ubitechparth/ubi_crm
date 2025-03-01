
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/custom_appbar.dart';
import 'package:ubi_crm/core_widget/drawer.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';
import 'package:ubi_crm/core_widget/list_tile_widget.dart';
import 'package:ubi_crm/features/setting_module/settings/controller/settings_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class SettingsPage extends GetView<SettingsController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  final controller = Get.find<SettingsController>();

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
return Scaffold(
    key: _scaffoldKey,
   drawer: getAppDrawer(context),
    backgroundColor: Colors.white,
    appBar: CustomAppBar(
     title:  AppTextStyle.appBarText( "OnHomeSettingsButton".tr),
      leading: IconButton(
          icon:  Icon(Icons.menu,color: AppColor.whiteOriginalColor,),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          }),
    ),
    body:  byPermissionList());
  }

  byPermissionList() {

    return SizedBox(
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
            children: [
              CustomListTileWidget(
                title: 'My Profile',
                onTap: (){},
                icon: AppIcons.personIcon(color: AppColor.primaryOriginalColor),
                titleStyle:  AppTextStyle.bodyText6B(),

              ),
              CustomListTileWidget(
                title: 'Change Password',
                onTap: (){},
                icon: AppIcons.passwordIcon(color: AppColor.primaryOriginalColor),
                titleStyle:  AppTextStyle.bodyText6B(),
              ),

              CustomListTileWidget(
                title: 'Language',
                onTap: (){},
                icon: AppIcons.languageIcon(color: AppColor.primaryOriginalColor),
                titleStyle:  AppTextStyle.bodyText6B(),
              ),

              CustomListTileWidget(
                title: 'About',
                onTap: (){},
                icon: AppIcons.infoIcon(color: AppColor.primaryOriginalColor),
                titleStyle:  AppTextStyle.bodyText6B(),
              ),
        ]),
      ),
    );
  }
}
