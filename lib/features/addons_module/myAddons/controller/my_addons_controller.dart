import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/app_assets.dart';

import '../../../../core/video_url_collection.dart';
import '../../widgets/addons_card.dart';

class MyAddonsController extends GetxController {



  RxList myAddonCard = [].obs;
  RxList suggestedAddonCard = [].obs;
  RxBool isLoading = false.obs;
  RxBool isTextProcessing = false.obs;
  RxBool isButtonDisables = true.obs;
  RxBool isSwitchedMyAddon = false.obs;
  final mYAddonPinFormKey = GlobalKey<FormState>();
  TextEditingController newPinController = TextEditingController();
  TextEditingController cnfPinController = TextEditingController();
  RxBool confirmLoader = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAddonsValue();
  }

  void _handleLocationTracking() async {
  /*  await checkInternet(
      function: () async {
        await checkPlan(
          function: () {
            DoNotify().alertMsg("employeeTrackingInstall".tr);
          },
        );
      },
    );*/
  }
  void _handleGeoFenceTap() async {
    /*await checkInternet(
      function: () {
        checkPlan(
          function: () {
            Get.toNamed(RouteConstant.geoFenceList);
          },
        );
      },
    );*/
  }
  void _handleVisitsTap() async {
    /*checkPlan(
      function: () {
        Get.toNamed(
          RouteConstant.visit,
        );
      },
    );*/
  }




  void getAddonsValue() async {
    isLoading.toggle();

    RxList addonCardList = [
      AddonCard(
        permissionSts: false,
        sSts: 12,
        text: 'Employee Tracking',
        event: 'track_location',
        image: AppAssets.svg.locationTracking,
        description: 'employeeTrackingDescription'.tr,
        url: UrlCollection.employeeTracking,
        name: 'Track Location',
        onTap: _handleLocationTracking,
      ),

      AddonCard(
        permissionSts: true,
        sSts: 34,
        text: 'trackVisitsText'.tr,
        image: AppAssets.svg.visitImage,
        description: 'trackVisitsDescription'.tr,
        url: UrlCollection.trackVisit,
        name: 'Visits',
        onTap: _handleVisitsTap,
      ),
      AddonCard(
        permissionSts: true,
        sSts: 12,
        text: 'Attendance',
        event: 'geofence',
        image: AppAssets.svg.attendance,
        description: 'geofenceDescription'.tr,
        url: UrlCollection.geofence,
        name: 'Geo-fence',
        onTap: _handleGeoFenceTap,
      ),
      AddonCard(
        permissionSts: true,
        sSts: 12,
        text: 'advancedLeaveText'.tr,
        event: 'leave_time_off',
        image: AppAssets.svg.advancedLeave  ,
        description: 'leaveDescription'.tr,
        url: UrlCollection.leaveHRM,
        name: 'AdvanceLeave', //adv leave
        onTap: () async {
         /* checkInternet(
            function: () {
              checkPlan(
                function: () {
                  Get.toNamed(RouteConstant.leaveTimeOff);
                },
              );
            },
          );*/
        },
      ),
      AddonCard(
        permissionSts:true,
        sSts: 12,
        text: 'Advance_Payroll'.tr,
        event: 'payroll',
        image: AppAssets.svg.payroll,
        description: 'PayrollDesc'.tr,
        url: UrlCollection.payroll,
        name: 'AdvancePayroll',
        onTap: () async {

        },
      ),

    ].obs;

    addonCardList.refresh();
    myAddonCard.value = addonCardList.where((e) => e.permissionSts == true).toList();
    suggestedAddonCard.value = addonCardList.where((e) => e.permissionSts == false).toList();


    myAddonCard.removeWhere((element) => element.name == 'Leave' && element.sSts == 1);
    myAddonCard.refresh();

    suggestedAddonCard.removeWhere((element) => element.name == 'Team Attendance');

    suggestedAddonCard.removeWhere((element) => element.name == 'Payroll');
    suggestedAddonCard.removeWhere((element) => element.name == 'AdvanceLeave' && element.sSts == 0);

    suggestedAddonCard.refresh();
    isLoading.toggle();
  }
}
