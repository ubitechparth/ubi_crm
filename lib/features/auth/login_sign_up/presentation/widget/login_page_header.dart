import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/login_signup_controller.dart';

class LoginPageHeader extends StatelessWidget {
  const LoginPageHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return  buildLoginPageHeader(Get.find<LoginSignupController>());
  }
}

Widget buildLoginPageHeader(LoginSignupController controller){
  return Column(
    children: [
      Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30), // Radius for the bottom-left corner
              bottomRight: Radius.circular(30), // Radius for the bottom-right corner
            ),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30), // Radius for the top-right corner
                  ),
                ),
                width:Get.width,
                height: Get.height*0.33,
                child: Image.asset(
                  AppAssets.image.loginPageHeader ,
                  fit: BoxFit.cover,
                )
            ),
          ),

        ],
      ),
    ],
  );
}
