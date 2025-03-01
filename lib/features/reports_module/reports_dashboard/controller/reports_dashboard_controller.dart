import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';
import 'package:ubi_crm/core_widget/list_tile_widget.dart';
import 'package:ubi_crm/features/reports_module/reports_dashboard/view/widget/report_dashboard_list.dart';
import 'package:ubi_crm/theme/color_constant.dart';

class ReportsDashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late List<GlobalKey> expansionTile;
  RxInt selected = (-1).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    expansionTile = List<GlobalKey>.generate(
      reportDataList.length,
      (index) => GlobalKey(),
    );
  }

  late RxList<ReportsDashboardList> reportDataList = <ReportsDashboardList>[
    ReportsDashboardList(
        title: 'salesText'.tr,
        icon: AppIcons.salesPerson(color: AppColor.primaryOriginalColor),
        children: [
          CustomListTileWidget(
            title: 'Sales by Customer',
            onTap: () {},
          ),
          CustomListTileWidget(
            title: 'Sales by Sales Person',
            onTap: () {},
          ),
          CustomListTileWidget(
            title: 'Sales by Item',
            onTap: () {},
          ),
        ]),
    ReportsDashboardList(
        title: 'leadsText'.tr,
        icon: AppIcons.leadsIcon(color: AppColor.primaryOriginalColor),
        children: [
          CustomListTileWidget(
            title: 'Leads by Rating',
            onTap: () {},
          ),
          CustomListTileWidget(
            title: 'Leads by Industry',
            onTap: () {},
          ),
          CustomListTileWidget(
            title: 'Leads by Product',
            onTap: () {},
          ),
          CustomListTileWidget(
            title: 'Leads by Deal Amount',
            onTap: () {},
          ),
          CustomListTileWidget(
            title: 'Leads by Sales Person',
            onTap: () {},
          ),
          CustomListTileWidget(
            title: 'Leads by Item',
            onTap: () {},
          ),
        ]),
  ].obs;
}
