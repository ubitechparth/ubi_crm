import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core_widget/loader.dart';

class CommonLoader {
  showOverlayLoader() {
    debugPrint('Login widget overlay Loader..');
    return showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) =>
      const PopScope(
        canPop: false,
        child: Center(child: Loader2()),
      ),
    );
  }

}