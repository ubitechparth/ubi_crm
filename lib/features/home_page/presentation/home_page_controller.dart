import 'package:get/get.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/features/home_page/domain/entities/quick_access_card_entities.dart';

class HomePageController extends GetxController{

  RxList quickAccessCardList = [].obs;


  @override
  onInit() async {
    super.onInit();
    await hrmMakeCard();
  }

  hrmMakeCard() {

    quickAccessCardList.value = <QuickAccessCardEntities>[

      QuickAccessCardEntities(
        title: "Employee Tracking",
        image: AppAssets.svg.locationTracking,
        onPlayButtonTap: () {
         // launchMap(UrlCollection.hrmVisit);
        },
        permission: true,
        onTap: () {},
      ),
      QuickAccessCardEntities(
        title: "trackVisitsText".tr,
        image: AppAssets.svg.visitImage,
        onPlayButtonTap: () {
         // launchMap(UrlCollection.hrmVisit);
        },
        permission: true,
        onTap: () {

        },
      ),

    QuickAccessCardEntities(
        title: "Attendance",
        image: AppAssets.svg.attendance,
        onPlayButtonTap: () {
         // launchMap(UrlCollection.hrmVisit);
        },
        permission: true,
        onTap: () {

        },
      ),

    QuickAccessCardEntities(
        title: "advancedLeaveText".tr,
        image: AppAssets.svg.advancedLeave,
        onPlayButtonTap: () {
         // launchMap(UrlCollection.hrmVisit);
        },
        permission: true,
        onTap: () {

        },
      ),
    QuickAccessCardEntities(
        title: 'Advance_Payroll'.tr,
        image: AppAssets.svg.locationTracking,
        onPlayButtonTap: () {
         // launchMap(UrlCollection.hrmVisit);
        },
        permission: true,
        onTap: () {

        },
      ),



    ];
    quickAccessCardList.value = quickAccessCardList.where((card) => card.permission).toList();
  }
}