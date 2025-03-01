import 'package:flutter/material.dart';

class ReportsDashboardList {
  Key? key;
  String? title;
  Widget? leading;
  Function? onTap;
  String? url;
  bool? showWidget;
  Widget? icon;
  List<Widget>? children;

  ReportsDashboardList(
      {
        this.key,
        this.title,
        this.leading,
        this.onTap,
        this.url,
        this.icon,
        this.showWidget,this.children});


}
