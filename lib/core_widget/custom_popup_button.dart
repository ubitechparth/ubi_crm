import 'package:flutter/material.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';
import 'package:ubi_crm/theme/color_constant.dart';

class CustomPopUpMenuButton extends StatelessWidget {
  const CustomPopUpMenuButton({
    super.key,
    this.icon,
    this.iconColor,
    this.onEditPress,
    this.onActivatePress,
    this.onDeletePress,
    this.onInactivePress,
    this.onAssignPress,
    this.onRemarkPress,
    this.onAttachmentPress,
    this.onViewAttnPress,
    this.makeAbsentPress,
    this.makePresentPress,
    this.remarkPress,
    this.showEdit = false,
    this.showInactive = false,
    this.showActivate = false,
    this.showDelete = false,
    this.showAssign = false,
    this.showRemarks = false,
    this.showAttachment = false,
    this.viewAttendance = false,
    this.makeAbsent = false,
    this.makePresent = false,
    this.remarkView = false,
    required this.itemBuilder,
  });

  final Widget? icon;
  final Color? iconColor;
  final VoidCallback? onEditPress;
  final VoidCallback? onInactivePress;
  final VoidCallback? onActivatePress;
  final VoidCallback? onDeletePress;
  final VoidCallback? onAssignPress;
  final VoidCallback? onRemarkPress;
  final VoidCallback? onAttachmentPress;
  final VoidCallback? onViewAttnPress;
  final VoidCallback? makeAbsentPress;
  final VoidCallback? makePresentPress;
  final VoidCallback? remarkPress;
  final bool showEdit;
  final bool showInactive;
  final bool showActivate;
  final bool showDelete;
  final bool showAssign;
  final bool showRemarks;
  final bool showAttachment;
  final bool viewAttendance;
  final bool makeAbsent;
  final bool makePresent;
  final bool remarkView;
  final List<PopupMenuEntry<void Function()>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VoidCallback>(
      icon: icon ??  AppIcons.moveVertIcon(color: iconColor??AppColor.blackLighterColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.all(0),
      menuPadding: EdgeInsets.all(0),
      itemBuilder: itemBuilder,
      onSelected: (callback) => callback.call(),
    );
  }
}
