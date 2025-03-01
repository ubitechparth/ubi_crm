import 'package:flutter/material.dart';
import 'package:ubi_crm/theme/color_constant.dart';
class CardComponent extends StatelessWidget {
  const CardComponent(
      { super.key,
        this.child,
        this.borderColor,
        this.backgroundColor,
        this.innerPadding,
        this.outerPadding,
        this.gradient,
        this.borderRadius,
      });

  final Widget? child;
  final Color? borderColor;
  final Color? backgroundColor;
  final EdgeInsets? outerPadding;
  final EdgeInsets? innerPadding;
  final bool? gradient;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Container(
          padding: innerPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColor.whiteOriginalColor,
            borderRadius: BorderRadius.circular(borderRadius??12),
            border: Border.all(
              color: borderColor ?? const Color(0xffe8fffc) ,
              width: 1,
            ),
            boxShadow:  const [
              BoxShadow(
                color: Color(0x3fd0d0d0),
                blurRadius: 8,
                offset: Offset(0, 9),
              ),
            ],
            gradient: gradient == true ? AppColor.primaryGradientColor : null,
          ),
          child: child),
    );
  }
}
