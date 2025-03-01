import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubi_crm/features/splash_screen/controller/splash_controller.dart';

class SplashScreen extends GetView<SplashScreenController>{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFCFE),   // same as gif image
      body: SvgPicture.asset('assets/splash_assets/splash screen.svg'),
    );
  }


}