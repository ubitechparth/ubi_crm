import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';

import 'package:ubi_crm/theme/color_constant.dart';

class SnackBarWidget {
  final ValueNotifier<bool> _isSnackbarVisible = ValueNotifier<bool>(false);

  callSnack(waringType, msg, color) {
    if (!_isSnackbarVisible.value) {
      // Show the snackbar
      _isSnackbarVisible.value = true;
      return Get.snackbar(
        waringType,
        msg,
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: color,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        snackbarStatus: (status) {
          if (status == SnackbarStatus.CLOSED) {
            _isSnackbarVisible.value = false;
          }
          if (kDebugMode) {
            print(status);
          }
        },
      );
    }
  }



  successfulMsg(msg) {
    if (!_isSnackbarVisible.value) {
      // Show the snackbar
      _isSnackbarVisible.value = true;
      return Get.snackbar(
        "SuccessText".tr,
        msg,
        icon: const Icon(Icons.check, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.primaryOriginalColor,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        snackbarStatus: (status) {
          if (status == SnackbarStatus.CLOSED) {
            _isSnackbarVisible.value = false;
          }
          if (kDebugMode) {
            print(status);
          }
        },
      );
    }
  }

  alertMsg(msg) {
    if (!_isSnackbarVisible.value) {
      // Show the snackbar
      _isSnackbarVisible.value = true;
      return Get.snackbar(
        "AlertText".tr,
        msg,
        // icon: Icon(Icons.warning_amber_outlined, color: Colors.white),
        titleText: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.warning_amber_outlined,
              color: Colors.white,
              size: Get.height * 0.03,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            Text(
              "AlertText".tr,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: Get.height * 0.024,
              ),
            ),
          ],
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.warningColor,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        snackbarStatus: (status) {
          if (status == SnackbarStatus.CLOSED) {
            _isSnackbarVisible.value = false;
          }
          if (kDebugMode) {
            print(status);
          }
        },
      );
    }
  }

  warningMsg({String? message,String? title,Widget? icon}) {
    if (!_isSnackbarVisible.value) {
      // Show the snackbar
      _isSnackbarVisible.value = true;
      return Get.snackbar(
        title??"WarningText".tr,
        message.toString(),
        icon:  icon??CircleAvatar(radius: 13,backgroundColor: AppColor.whiteOriginalColor, child: AppIcons.clearIcon(size: 18,color: Colors.red), ),

        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.dangerColor,
        borderRadius: 10,
        margin: const EdgeInsets.all(12),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        snackbarStatus: (status) {
          if (status == SnackbarStatus.CLOSED) {
            _isSnackbarVisible.value = false;
          }
          if (kDebugMode) {
            print(status);
          }
        },
      );
    }
  }

  warningMsgDemo(title, msg) {
    if (!_isSnackbarVisible.value) {
      // Show the snackbar
      _isSnackbarVisible.value = true;
      return Get.snackbar(
        title,
        msg,
        icon: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)), child: AppIcons.clearIcon()),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.dangerColor,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        snackbarStatus: (status) {
          if (status == SnackbarStatus.CLOSED) {
            _isSnackbarVisible.value = false;
          }
          if (kDebugMode) {
            print(status);
          }
        },
      );
    }
  }

  versionCode(msg) {
    if (!_isSnackbarVisible.value) {
      // Show the snackbar
      _isSnackbarVisible.value = true;
      return Get.snackbar(
        'Cleared',
        msg,
        //icon:  Icon(Icons.clear, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.primaryOriginalColor,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        snackbarStatus: (status) {
          if (status == SnackbarStatus.CLOSED) {
            _isSnackbarVisible.value = false;
          }
          if (kDebugMode) {
            print(status);
          }
        },
      );
    }
  }
}
