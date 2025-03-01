import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/globals.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';
import 'package:ubi_crm/core_widget/snack_bar_widget.dart';
import 'package:ubi_crm/theme/color_constant.dart';

class NetworkUtils {
  static Future<void> checkInternetAndExecute(VoidCallback onSuccess) async {
    if(isNetworkAvailable.value == true) {
      // Internet is available, execute the callback
      onSuccess();
    } else {
      // No internet, show a SnackBar
      _showNoInternetAlert();
    }
  }

  static void _showNoInternetAlert() {
    if (Get.context != null) {
      SnackBarWidget().warningMsg(icon: AppIcons.wifiOff(color: AppColor.whiteOriginalColor), title: 'Connection Error', message: 'NoInternetText'.tr);
    }
  }
}