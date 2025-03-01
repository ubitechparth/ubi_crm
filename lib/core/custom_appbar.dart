import 'package:flutter/material.dart';
import 'package:ubi_crm/theme/color_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.spacing,
    this.elevation = 2.0,
    this.centerTitle,
    this.padding
  });
  final Widget? title;
  final Widget? leading;
  final double elevation;
  final List<Widget>? actions;
  final double? spacing;
  final bool? centerTitle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
return Material(
  elevation: elevation,
  child: Container(
    decoration: BoxDecoration(
      gradient: AppColor.primaryGradientColor,
    ),
    padding: padding,
    child: AppBar(
      elevation: 0.0,
      title: title!,
      backgroundColor: Colors.transparent,
      actions: actions,
      leading: leading,
      titleSpacing: spacing ?? 1,
      centerTitle: centerTitle ?? false,
    ),
  ),
);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

