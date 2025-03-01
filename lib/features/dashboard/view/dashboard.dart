import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/core/globals.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';
import 'package:ubi_crm/features/addons_module/addon_page/view/addons_view.dart';
import 'package:ubi_crm/features/customers_module/customers/presentation/view/customers_view.dart';
import 'package:ubi_crm/features/dashboard/controller/dashboard_controller.dart';
import 'package:ubi_crm/features/home_page/presentation/home_page_view.dart';
import 'package:ubi_crm/features/lead_module/lead/presentation/view/lead_view.dart';
import 'package:ubi_crm/features/reports_module/reports_dashboard/view/reports_dashboard_view.dart';
import 'package:ubi_crm/theme/color_constant.dart';

// ignore: must_be_immutable
class Dashboard extends GetView<DashboardController> {
  @override
  final controller = Get.find<DashboardController>();

  RxBool returnValue = true.obs;
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
return PopScope(
    onPopInvokedWithResult: (didPop,dynamic) {},
    child:  PersistentTabView(
          floatingActionButton: null,
          navBarHeight: Get.height*0.09,
          controller: controller.persistentTabController,
          stateManagement: true,
          popAllScreensOnTapOfSelectedTab: false,
          popActionScreens: PopActionScreensType.all,
          screenTransitionAnimation: const ScreenTransitionAnimation.none(),
          tabs: _navBarsItems(),
          onTabChanged: (value) {
            if (value == 2) {
              controller.callAddonController();
            }

            animatedIcon.value = value;
          },
          navBarBuilder: (navBarConfig) => Style13BottomNavBar(
            navBarConfig: navBarConfig,
          ),
      backgroundColor: AppColor.primaryOriginalColor,
          )
);
  }


  List<PersistentTabConfig> _navBarsItems() {
    return [
      PersistentTabConfig(
        item: ItemConfig(
          activeForegroundColor: AppColor.primaryOriginalColor,
          inactiveForegroundColor: AppColor.greyOriginalColor,
          icon: AppIcons.homeIcon(),
          title: ("OnHomeHomeButton".tr),
        ),
        screen:  HomePageView(),
      ),

    PersistentTabConfig(
    item: ItemConfig(
    activeForegroundColor: AppColor.primaryOriginalColor,
    inactiveForegroundColor: AppColor.greyOriginalColor,
      icon: AppIcons.domainRounded(),
    title: ("leadsText".tr),
    ),
    screen: LeadView(),
    ),

      PersistentTabConfig(
        screen:  AddonsPage(),
        item: ItemConfig(
          activeForegroundColor: AppColor.transparentColor,
          inactiveForegroundColor: AppColor.transparentColor,
          icon: Container(
            width: 62,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColor.primaryGradientColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Obx(
                () => animatedIcon.value == 2
                    ? GestureDetector(
                        onTap: () {
                          debugPrint("addon btn call");
                          animatedIcon.value = 0;
                          controller.persistentTabController.jumpToTab(0);
                          // globals.animatedIcon.refresh();
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ))
                    : Image.asset(AppAssets.image.addonIcon,
                        fit: BoxFit.contain, alignment: Alignment.center),
              ),
            ),
          ),
          title: ("OnHomeHomeButton".tr),
        ),
      ),




      PersistentTabConfig(
        screen: CustomersView(),
        item: ItemConfig(
          activeForegroundColor: AppColor.primaryOriginalColor,
          inactiveForegroundColor:AppColor.greyOriginalColor,
          icon: AppIcons.handsHelping(),
          title: ('Customers'),
          // title: ("OnHomeHomeButton".tr),
        ),
      ),
      PersistentTabConfig(
        item: ItemConfig(
          activeForegroundColor: AppColor.primaryOriginalColor,
          inactiveForegroundColor: AppColor.greyOriginalColor,
          icon: AppIcons.reportsIcon(),
          title: ("reportsText".tr),
        ),
        screen:  ReportsDashboardView(),
      ),
    ];
  }
}




class NewReportsView extends StatelessWidget {
  const NewReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class LogsView extends StatelessWidget {
  const LogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



class ApprovalsPage extends StatelessWidget {
  const ApprovalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class SelfProfileView extends StatelessWidget {
  const SelfProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}




