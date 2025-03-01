import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core_widget/text_widget.dart';
import 'package:ubi_crm/theme/color_constant.dart';


class CancelButtonWidget extends StatefulWidget {
  const CancelButtonWidget({super.key,this.onPressed,this.child,this.textColor,this.buttonBorderColor,this.elevation,this.borderWidth,this.fontWeight});
  final void Function()? onPressed;
  final Widget? child;
  final Color? textColor;
  final Color? buttonBorderColor;
  final double? elevation;
  final double? borderWidth;
  final FontWeight? fontWeight;

  @override
  State<CancelButtonWidget> createState() => _CancelButtonWidgetState();
}

class _CancelButtonWidgetState extends State<CancelButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed:widget.onPressed??()=>Get.back(),
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder( // Ensures a square/rectangle shape
            borderRadius: BorderRadius.all(Radius.circular(4)), // No rounded corners
          ),
          side: BorderSide(
              color: widget.buttonBorderColor??AppColor.primaryOriginalColor,
              width: widget.borderWidth??1.5),
          elevation: widget.elevation??1.5,
          backgroundColor: AppColor.whiteOriginalColor),
      child: widget.child ?? TextWidget(text: 'NewCancelText'.tr,textColor: AppColor.primaryOriginalColor),
    );
  }
}