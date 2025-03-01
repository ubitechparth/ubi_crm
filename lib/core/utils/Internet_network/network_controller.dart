import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/globals.dart';

class NetworkController extends GetxController with WidgetsBindingObserver{
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> connectivityResult) async {
      await  checkLowInternet();//this will hit google service and return low connectivity result
    debugPrint("ConnectivityResult ======== $connectivityResult");
    if (connectivityResult.contains(ConnectivityResult.none)) {
      isNetworkAvailable.value = false;


    }
    else if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.ethernet) || connectivityResult.contains(ConnectivityResult.vpn)) {
      isNetworkAvailable.value = true;

    }

    else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      // NOT IMPLEMENTED
    }
    else if (connectivityResult.contains(ConnectivityResult.other)) {
      // NOT IMPLEMENTED
    }
    else {
      isNetworkAvailable.value = false;
    }
  }

  void noInternetHandling () {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.rawSnackbar(
        messageText: const Center(
          child: Text(
              'NO INTERNET',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 8
              )
          ),
        ),
        isDismissible: false,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red[400]!,
        icon : const Icon(Icons.wifi_off, color: Colors.white, size: 8,),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED
    );
  }

  void internetAvailableHandling () {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.rawSnackbar(
        messageText: const Center(
          child: Text(
              'INTERNET CONNECTED',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 8
              )
          ),
        ),
        isDismissible: false,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green[400]!,
        icon : const Icon(Icons.wifi, color: Colors.white, size: 8,),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED
    );
  }

  void internetExceptionHandling () {
    Get.rawSnackbar(
        messageText: const Text(
            'PLEASE CHECK YOUR NETWORK',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            )
        ),
        isDismissible: false,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red[400]!,
        icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED
    );
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        debugPrint("Inactive didChangeAppLifecycleState");
        break;

      case AppLifecycleState.paused:

        debugPrint("Paused by didChangeAppLifecycleState");
        break;

      case AppLifecycleState.resumed:

        debugPrint("code working didChangeAppLifecycleState");
        // await syncData.getCurrentAttAction(appPrefs.empId, orgId,true);
        break;

      case AppLifecycleState.detached:
        debugPrint("Suspending by didChangeAppLifecycleState");
        break;

      default:
        debugPrint(" unable to get app state by didChangeAppLifecycleState");
        break;
    }
  }



  Future<int> checkLowInternet() async{
    try {
      final result = await InternetAddress.lookup('google.com').timeout(const Duration(seconds:10));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty){
        serverConnected=1;
      }else{
        serverConnected=0;
      }
    } on SocketException catch (_) {
      serverConnected=0;
    }on TimeoutException catch(_){
      serverConnected=0;
    }
    return serverConnected;
  }



}