import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/core/globals.dart';
import 'package:ubi_crm/core/routes/route_constant.dart';
import 'package:ubi_crm/core_widget/snack_bar_widget.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/login_signup_controller.dart';

class GoogleMicroSoftButtonWidget extends StatelessWidget {
  const GoogleMicroSoftButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return buildOtherButtonWidget(context,Get.find<LoginSignupController>());
  }
}

Widget buildOtherButtonWidget(context,controller){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Divider(color: Color(0xFFE2E2E2))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("OrText".tr,   style: TextStyle(color: Color(0XFF586377), fontSize: Get.width*0.045,fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(child: Divider(color: Color(0xFFE2E2E2))),
          ],
        ),
        SizedBox(height: Get.height*0.01,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: ()async{
                if(isNetworkAvailable.value == true) {
                  controller.applyMethod = 'google';
                  controller.googleLogin(context);
                }
                else{
                  SnackBarWidget().alertMsg("NoInternetText".tr);
                }
              },
              child: Image.asset(
                AppAssets.image.googleImage,height: Get.height*0.09,
              ),
            ),
            SizedBox(width: Get.width * 0.060),
            Platform.isAndroid ? InkWell(
              onTap: () async{
                if(isNetworkAvailable.value == true) {
                  controller.applyMethod = 'microsoft';
                  await controller.loginWithMicrosoft();
                }
                else{
                  SnackBarWidget().alertMsg("NoInternetText".tr);
                }
              },
              child: Image.asset(
                AppAssets.image.microSoftImage,height: Get.height*0.09,
              ),
            )
                : InkWell(
              onTap: () async{
                if(isNetworkAvailable.value == true) {
                  if(Platform.isIOS == true){
                    controller.applyMethod = 'apple';
                    await controller.loginWithApple(context);
                  }
                  else{
                    SnackBarWidget().alertMsg('feature_only_IOS'.tr);
                  }
                }
                else{
                  SnackBarWidget().alertMsg("NoInternetText".tr);
                }
              },
              child: Image.asset(
                  AppAssets.image.appleImage,height: Get.height*0.09,
              ),
            ),
            SizedBox(width: Get.width * 0.060),

            InkWell(
              onTap: () => showCupertinoBottomSheet(controller),
              child: Image.asset(
                AppAssets.image.loginPageMore,height: Get.height*0.09,
              ),
            ),

            // :SizedBox()
          ],
        ),
      ],
    ),
  );
}

 showCupertinoBottomSheet(controller) {
  return Get.bottomSheet(
     backgroundColor: Colors.white,
     isScrollControlled: true,
     isDismissible: true,
     shape: const RoundedRectangleBorder(
       borderRadius: BorderRadius.vertical(
         top: Radius.circular(20.0),
       ),
     ),
     Container(
       height: Get.height * 0.2,
       padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
       child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Color(0XFFE2E2E2)
                    )
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child:  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(left: Get.width*0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.email,size: 17,),
                          SizedBox(width: 12,),
                          Text('Continue_with_Email'.tr),
                        ],
                      ),
                    ),
                    onTap: ()
                    {
                      controller.mobileNumberController.clear();
                      Get.back();
                      Get.toNamed(RouteConstant.loginWithEmail);
                    },
                  ),
                ),

              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: Color(0XFFE2E2E2)
                    )
                ),
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Platform.isAndroid
                    ? InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width*0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.apple,size: 19),
                        SizedBox(width: 12,),
                        Text('Continue_with_apple'.tr),
                      ],
                    ),
                  ),
                  onTap: () async{
                    Get.back();
                    if(isNetworkAvailable.value == true) {
                      if(Platform.isIOS == true){
                        controller.applyMethod = 'apple';
                        await controller.loginWithApple();
                      }
                      else{
                        SnackBarWidget().alertMsg('feature_only_IOS'.tr);
                      }
                    }
                    else{
                      SnackBarWidget().alertMsg("NoInternetText".tr);
                    }
                  },
                )
                    :  InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width*0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(AppAssets.image.microsoftImage,height: 15,width: 15,),
                        SizedBox(width: 12,),
                        Text('Continue_with_Microsoft'.tr),
                      ],
                    ),
                  ),
                  onTap: () async{
                    if(isNetworkAvailable.value == true) {
                      controller.applyMethod = 'microsoft';
                      await controller.loginWithMicrosoft();
                    }
                    else{
                      SnackBarWidget().alertMsg("NoInternetText".tr);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }


