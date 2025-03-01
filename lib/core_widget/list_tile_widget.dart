import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class CustomListTileWidget extends StatelessWidget {

  final Widget? icon;
  final Widget? trailingIcon;
  final double? iconSize;
  final String title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final Function() onTap;

   const CustomListTileWidget({
     super.key,
      this.icon,
     this.trailingIcon,
     this.iconSize,
     required this.title,
     this.subtitle,
     required this.onTap,
     this.titleStyle,
     this.subTitleStyle
   }); // Example lightGray color

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(bottom: BorderSide(color: AppColor.grayLightGrey2Color)),
      hoverColor: AppColor.greyOriginalColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      visualDensity: VisualDensity(vertical: 0),
      dense: true,
      leading: icon,
      title: Text(
        title, // Assuming you're using GetX for translation
        style: titleStyle??AppTextStyle.bodyText5M(),
      ),
      subtitle: subtitle != null && subtitle!.isNotEmpty ? Text(subtitle!) : null,
      trailing: trailingIcon?? Icon(EvaIcons.chevronRight,color: Colors.grey[500],),
      onTap: onTap,
      selectedTileColor: AppColor.primaryOriginalColor,
    );
  }
}
