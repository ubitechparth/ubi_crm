import 'package:flutter/material.dart';
import 'package:ubi_crm/theme/text_style.dart';

class BuildPopUpMenuButton extends PopupMenuItem<VoidCallback> {
  BuildPopUpMenuButton({super.key,
    required String text,
    required VoidCallback onTap,
    Widget? icon,
  }) : super(
    value: onTap,
    child: Row(
      children: [
        if (icon != null) icon,
        const SizedBox(width: 12),
        Text(
          text,
          style: AppTextStyle.bodyText6SB(),
          textScaler: TextScaler.linear(1),
        ),
      ],
    ),
  );
}
