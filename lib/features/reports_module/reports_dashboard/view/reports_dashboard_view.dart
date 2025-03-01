import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/custom_appbar.dart';
import 'package:ubi_crm/core_widget/drawer.dart';
import 'package:ubi_crm/features/reports_module/reports_dashboard/controller/reports_dashboard_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class ReportsDashboardView extends GetView<ReportsDashboardController> {
  ReportsDashboardView({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: getAppDrawer(context),
        appBar: CustomAppBar(
          title: AppTextStyle.appBarText("New_Reports_Text".tr),
          leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: AppColor.whiteOriginalColor,
              ),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              }),
        ),
        body: Obx(
          () => ListView.builder(
            key: Key('builder ${controller.selected.toString()}'),
            padding: const EdgeInsets.all(5),
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.reportDataList.length,
            itemBuilder: (BuildContext context, int index) {
              return Obx(() => Column(
                    children: [
                      ExpansionTile(
                        key: Key(index.toString()),
                        shape: Border.all(color: AppColor.transparentColor),
                        initiallyExpanded: index == controller.selected.value,
                        onExpansionChanged: (newState) {
                          if (newState) {
                            controller.selected.value = index;
                          } else {
                            controller.selected.value = -1;
                          }
                        },
                        leading: controller.reportDataList[index].icon,
                        iconColor: AppColor.primaryOriginalColor,
                        title: Text(
                          controller.reportDataList[index].title.toString(),
                          style: AppTextStyle.bodyText6B(),
                        ),
                        collapsedShape: Border(
                            bottom: BorderSide(color: AppColor.greyOriginalColor)),

                        visualDensity: VisualDensity(vertical: 1),
                        children: controller.reportDataList[index].children!,
                      ),
                    ],
                  ));
            },
          ),
        ));
  }
}
