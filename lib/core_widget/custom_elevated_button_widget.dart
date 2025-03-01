import 'package:flutter/material.dart';
import 'package:ubi_crm/theme/color_constant.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.child,
    this.onPressed,
    this.borderRadius,
    this.elevation,
    this.shape,
    this.backgroundColor,
  });

  final Widget? child;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final double? elevation;
  final OutlinedBorder? shape;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 2.0,
        shape: shape ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
        ),
        backgroundColor: backgroundColor ?? AppColor.primaryOriginalColor,
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            return backgroundColor ?? AppColor.primaryOriginalColor;
          },
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
