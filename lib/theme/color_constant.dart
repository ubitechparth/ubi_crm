import 'package:flutter/material.dart';

class AppColor {

  //Application primary color
  static const Color primaryOriginalColor = Color(0XFF1DB4D9);
  static Color primaryLightColor = Color(0XFF6DD1EB);
  static Color primaryLightestColor = Color(0XFFA0E0F2);
  static Color primaryLighterColor = Color(0XFFD3EFF8);
  static Color primaryVeryLighterColor = Color(0XFFfcffff);
  static Color primaryDarkColor = Color(0XFF0A5D72);
  static Color primaryGradientEndColor = Color(0XFFC7E8F0);
  static Color purpleGradientEndColor = Color(0XFFA975FD);

  // Black Color
  static Color blackOriginalColor = Color(0XFF1A1A1A);
  static Color blackLighterColor = Color(0xFF333333);  // Lighter shade of black
  static Color blackLightestColor = Color(0xFF4D4D4D);  // lightest shade of black


  // Gradient using static colors
  static LinearGradient primaryGradientColor = LinearGradient(
    colors: [
      AppColor.primaryOriginalColor,
      AppColor.purpleGradientEndColor
    ],
    begin: Alignment.topLeft,
    end: Alignment(2.0, 3.0),
  );

  static Color whiteOriginalColor = Color(0XFFFFFFFF);

  //Grey Color
  static Color greyOriginalColor = Color(0XFF9E9E9E); // Standard gray: #9E9E9E
  static Color grayVeryLightColor = Color(0XFFFAFAFA); // Very light gray
  static Color grayLightGreyColor = Color(0XFFF5F5F5); // Light gray
  static Color grayLighterColor = Color(0XFFEEEEEE); // Lighter gray
  static Color grayLightGrey2Color = Color(0XFFE0E0E0); // Light gray 2
  static Color grayNeutralColor = Color(0XFFBDBDBD); // Neutral gray
  static Color grayDarkerColor = Color(0XFF757575); // Darker grey
  static Color grayDarkColor = Color(0XFF616161); // Dark gray
  static Color grayVeryDarkColor = Color(0XFF424242); // Very dark gray

  // Snack_bar Color
  static Color successColor = Color(0xff24b746);
  static Color warningColor = Color(0xffff8212);
  static Color dangerColor = Color(0xffEF5350);

  static Color transparentColor = Color(0X00FFFFFF);
}
