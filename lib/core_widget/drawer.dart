import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ubi_crm/core/globals.dart';
import 'package:ubi_crm/core/routes/route_constant.dart';
import 'package:ubi_crm/core_widget/custom_elevated_button_widget.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';
import 'package:ubi_crm/features/home_page/presentation/widgets/premium_feature.dart';
import 'package:ubi_crm/core_widget/snack_bar_widget.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

SnackBarWidget doNotify = SnackBarWidget();
String dateToShowRatingDialog = '';
String dateShowedRatingDialog = '';
String dateShowedFeedbackDialog = '';
String dateToShowFeedbackDialog = '';
// ignore: non_constant_identifier_names
RxString Rating = ''.obs;
bool fiveStarRating = false;
bool rateUsDialogShown = false;
bool firstAttendance = false;
RxInt empId = 0.obs;
RxInt orgId = 0.obs;
bool companyFreshlyRegistered = false;
bool feedbackDialogShown = false;
RxBool isButtonDisabled = true.obs;
RxBool isButtonTapped = true.obs;
var currDate = DateTime.now();
var now = DateTime.now();
var formatter = DateFormat('yyyy-MM-dd');
var hrmFormatter = DateFormat('dd-MM-yyyy');
var hrmMMMFormatter = DateFormat('d-MMM-yyyy', 'en_US');
getAppDrawer(context) {
  return Drawer(
    backgroundColor: AppColor.primaryVeryLighterColor,
      child: ListView(children: <Widget>[
     buildHeader(
        // name: firstName.value,
        name: 'Regendra Suman',
        designation: 'Mobile App Developer',
        // designation: designationName.value,
        onClicked: () {
        }),

    Column(
      children: [
        buildMenuItem(
            text: 'OnHomeProfileButton'.tr,
            icon: AppIcons.personIcon(color: AppColor.primaryOriginalColor),
            onClicked: () async {

            }),

        // if (appPrefs.currentOrgStatus == "PremiumStandardOrg")
          buildMenuItem(
              text: 'drawer_userguide'.tr,
              icon: AppIcons.menuBookIcon(color: AppColor.primaryOriginalColor),
              onClicked: () async {

              }),
        buildMenuItem(
            text: 'drawer_tutorial'.tr,
            icon: AppIcons.videoIcon(color: AppColor.primaryOriginalColor),
            onClicked: () {

            }),


        if (userRoleStatus.value == 1 && Platform.isAndroid == true)
          buildMenuItem(
              text: 'schedule_drawer_demo'.tr,
              icon: AppIcons.alarmIcon(color: AppColor.primaryOriginalColor),
              onClicked: () {

              }),
     if (userRoleStatus.value == 1)
          buildMenuItem(
              text: 'broadcast_message'.tr,
              icon: AppIcons.msgOutlineIcon(color: AppColor.primaryOriginalColor),
              onClicked: () {
                Get.back();

              }),
/*
        buildMenuItem(
            text: 'drawer_language'.tr,
            icon: AppIcons.languageIcon(color: AppColor.primaryOriginalColor),
            onClicked: () {
              Get.toNamed(RouteConstant.languageSelectionPage);
            }),*/
      ],
    ),
    const Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
      child: Divider(),
    ),
        buildMenuItem(
            text: 'Sales Team',
            icon:  AppIcons.salesPerson(color: AppColor.primaryOriginalColor),
            onClicked: () {
              Get.toNamed(RouteConstant.salesTeamView);
            }),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
          child: Divider(),
        ),

        buildMenuItem(
            text: 'Home_refer_earn'.tr,
            icon: AppIcons.peopleAltRounded,

        ),

        buildMenuItem(
            text: 'drawer_rateus'.tr,
            icon: AppIcons.starIcon(color: AppColor.primaryOriginalColor),
            onClicked: () async {

            }),

        buildMenuItem(
            text: 'drawer_share'.tr,
            icon: AppIcons.shareIcon(color: AppColor.primaryOriginalColor),
            onClicked: () async {
            }),
       /* buildMenuItem(
            text: 'Clean_Up_text'.tr,
            icon: AppIcons.cleaningIcon(color: AppColor.primaryOriginalColor),
            onClicked: () async {

            }),*/
    ////////////////////////////  suraj Code Start //////////////////////////////////

    //////////////////////////  suraj code End  //////////////////////////////////
/*
    buildMenuItem(
        text: 'drawer_about'.tr,
        icon: AppIcons.infoIcon(color: AppColor.primaryOriginalColor),
        onClicked: () {

        }),*/

        buildMenuItem(
        text: 'Settings',
        icon: AppIcons.settingsIcon(color: AppColor.primaryOriginalColor),
        onClicked: () {
            Get.toNamed(RouteConstant.settingPage);
        }),

    buildMenuItem(
        text: 'drawer_logout'.tr,
        icon: AppIcons.logoutIcon(color: AppColor.primaryOriginalColor),
        onClicked: () async {
          Get.offAllNamed(RouteConstant.login); // remove all preferences
        }),
  ]));
}

Widget buildHeader({
  String? urlImage,
  String? name,
  String? designation,
  VoidCallback? onClicked,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onClicked,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: Get.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: AppColor.primaryGradientColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   // const PersistentProfileImage(size: 50,),
                     Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Tooltip(
                              message: "App Version",
                              // message: "App Version ${globals.topicAppVersionName}:${appPrefs.hrmProfileType}",
                              child: Text(
                                name!,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.extraHeading1B(color: AppColor.whiteOriginalColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.45,
                            child: Text(
                              designation!,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.bodyText4B(color: AppColor.whiteOriginalColor),

                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              SizedBox(
                      width: Get.width * 0.43,
                      height: Get.height * 0.04,
                      child: CustomButtonWidget(
                        backgroundColor: Colors.orange,
                        onPressed: () {
                          Navigator.of(Get.context!).push(showPremiumFeaturesRoute());
                        },
                        child: TextWidget(text:"Check Features"),
                      )
              ),

              ],
            ),
          ),
        ),
      ),
    );

Widget buildMenuItem({
  String? text,
  Widget? icon,
  VoidCallback? onClicked,
}) {
  return ListTile(
    minLeadingWidth: 30,
    visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
    leading: icon,
    title: GestureDetector(
      onLongPress: () {
        if(text == 'About'){
          //createInterimBugReport();
        }else if(text == 'Rate Us'){
        //  createInterimBugReport(text);
        }
        else if(text == 'Tutorial'){
         // appPrefs.showCameraOption = true;
         // showCameraOption.value = true;
         //  Fluttertoast.showToast(
         //    msg: 'Camera option enabled',
         //    gravity: ToastGravity.BOTTOM,
         //    backgroundColor: Colors.black54,
         //    textColor: white,
         //    timeInSecForIosWeb: 1,
         //  );
        }
      },
      child: Text(
        text!,
        style: AppTextStyle.bodyText5SB(),

      ),
    ),
    onTap: onClicked,
  );
}

/*Future<void> share() async {
  if(Platform.isAndroid && AppConfig.appName == 'ubiAttendance' ){
    Share.share('https://play.google.com/store/apps/details?id=org.ubitech.attendance',
        subject: 'I am using a great App to monitor attendance. Give it a try.');
  }
  else if(Platform.isAndroid && AppConfig.appName == 'ubiHrm'){
    Share.share('https://play.google.com/store/apps/details?id=com.ubihrm.ubihrm',
        subject: 'Hi! I have had a great experience with ubiHRM App! I highly recommend it to manage your Human resource. Download the Android app via the following link.');
  }
  else if (Platform.isIOS && AppConfig.appName == 'ubiAttendance'){
    Share.share('https://apps.apple.com/in/app/track-employee-attendance/id1375252261',
        subject: 'I am using a great App to monitor attendance. Give it a try.');
  }
  else if (Platform.isIOS && AppConfig.appName == 'ubiHrm'){
    Share.share('https://apps.apple.com/in/app/ubihrm/id1489689034',
        subject: 'Hi! I have had a great experience with ubiHRM App! I highly recommend it to manage your Human resource. Download the Android app via the following link.');
  }
}

Future showFeedbackDialog() async {
  String date = formatter.format(now);
  var twoDaysFromNow = currDate.add(const Duration(days: 2));
  String date1 = formatter.format(twoDaysFromNow);
  dateShowedFeedbackDialog = date.toString();
  dateToShowFeedbackDialog = date1.toString();
  final FocusNode myFocusNodeFeedback = FocusNode();
  TextEditingController feedbackController =  TextEditingController();
  return Get.dialog(
      AlertDialog(
        title:  Text(
          'onRateUsPopUpHelpQuery'.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15.0),
        ),
        content: SizedBox(
          height:Get.height * 0.3,
          child:  Container(
            decoration:  BoxDecoration(
                color:buttonColor.withValues(alpha:0.1),
                borderRadius:  const BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0))),
            alignment: Alignment.topCenter,
            child: Wrap(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: double.parse(Rating.value==''?'0.0':Rating.value),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) async {
                      if (rating > 3.0) {
                        await Future.delayed(const Duration(milliseconds: 800));

                        Rating.value = rating.toString();

                        return Get.dialog(SimpleDialog(
                          children: [
                            Column(children: <Widget>[
                              Platform.isAndroid
                                  ? Text('onRateUsPopUpPlayStore'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: Get.height * 0.022,
                                      fontWeight: FontWeight.normal))
                                  : Text('onRateUsPopUpAppStore'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Get.height * 0.022,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(height: Get.height * 0.03,),
                              CustomButtonWidget(
                                child: TextWidget(text: 'onRateUsPopUpGo'.tr),
                                onPressed: () async {

                                },
                              )
                            ])
                          ],
                        ));
                      }
                      else {
                        Rating.value = rating.toString();
                        appPrefs.rating = Rating.value;
                        appPrefs.hiveDb.delete("firstAttendance");
                      }
                    },
                  ),
                ],
              ),
              Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
                    child: CustomFormFieldComponent(
                      focusNode: myFocusNodeFeedback,
                      controller: feedbackController,
                      keyboardType: TextInputType.text,
                      color: Colors.white,
                        backgroundColor: Colors.white,
                        filled: true,
                        hintText: 'onRateUsPopUpWrite'.tr,
                      maxLines: 3,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTheme(
                        minWidth: 50.0,
                        //borderSide: BorderSide(color: Colors.green[700],),
                        shape:  RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(0.0),
                        ),
                        child:   CustomButtonWidget(
                          onPressed: () async {
                            if (double.parse(Rating.value) > 3.0) {
                              return Get.dialog(SimpleDialog(
                                children: [
                                  Column(children: <Widget>[
                                    Platform.isAndroid
                                        ? Text('onRateUsPopUpPlayStore'.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: Get.height * 0.022,
                                            fontWeight: FontWeight.normal))
                                        : Text(
                                      'onRateUsPopUpAppStore'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: Get.height * 0.022,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(height: Get.height * 0.03,),
                                 CustomButtonWidget(
                                      child: TextWidget(text: 'onRateUsPopUpGo'.tr,),
                                      onPressed: () async {

                                      },
                                    )
                                  ])
                                ],
                              ));
                            }
                            else {
                              var trimText = feedbackController.text.trim();
                              if(trimText.isEmpty){
                                return Get.dialog(
                                    AlertDialog(
                                        title: Text('AlertText'.tr,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 15.0),
                                        ),
                                        content: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("home_remark_please_enter".tr),
                                          ],
                                        ))
                                );
                              }
                              else {

                              }
                            }
                          },
                           child: TextWidget(text:
                            'SubmitText'.tr,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ),
      )
  );
}*/

Route showPremiumFeaturesRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PremiumFeaturesPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
