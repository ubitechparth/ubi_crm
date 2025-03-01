import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:ubi_crm/theme/color_constant.dart';

class AppIcons{
  static Widget homeIcon({Color? color})        {  return Icon(EvaIcons.homeOutline,          color: color);}
  static Widget settingsIcon({Color? color})    {  return Icon(Icons.settings,                color: color);}
  static Widget personIcon({Color? color})      {  return Icon(Icons.person,                  color: color);}
  static Widget menuBookIcon({Color? color})    {  return Icon(Icons.menu_book_rounded,       color: color);}
  static Widget videoIcon({Color? color})       {  return Icon(Icons.ondemand_video_rounded,  color: color);}
  static Widget msgOutlineIcon({Color? color})  {  return Icon(Icons.message_outlined,        color: color);}
  static Widget languageIcon({Color? color})    {  return Icon(Icons.language,                color: color);}
  static Widget alarmIcon({Color? color})       {  return Icon(Icons.access_alarm_sharp,      color: color);}
  static Widget shareIcon({Color? color})       {  return Icon(Icons.share,                   color: color);}
  static Widget cleaningIcon({Color? color})    {  return Icon(Icons.cleaning_services_rounded, color: color);}
  static Widget infoIcon({Color? color})        {  return Icon(Icons.info_outline_rounded,    color: color);}
  static Widget starIcon({Color? color})        {  return Icon(Icons.star,                    color: color);}
  static Widget reportsIcon({Color? color})     {  return Icon(EvaIcons.fileTextOutline,      color: color);}
  static Widget logoutIcon({Color? color})      {  return Icon(Icons.login_sharp,             color: color);}
  static Widget passwordIcon({Color? color})    {  return Icon(Icons.key,                     color: color);}
  static Widget calendarMonthIcon({Color? color,double? size})    {  return Icon(Icons.calendar_month,     color: color, size: size,);}
  static Widget calendarTodayIcon({Color? color, double? size})    {  return Icon(Icons.calendar_today_outlined,     color: color, size:size);}
  static Widget searchIcon({Color? color, double? size})    {  return Icon(Icons.search,     color: color, size: size,);}
  static Widget moveVertIcon({Color? color})    {  return Icon(Icons.more_vert,     color: color);}
  static Widget arrowBackIcon({Color? color})    {  return Icon(Icons.arrow_back,     color: color);}
  static Widget phoneIcon({Color? color})    {  return Icon(Icons.phone,     color: color?? AppColor.primaryOriginalColor);}
  static Widget emailIcon({Color? color})    {  return Icon(Icons.email,     color: color?? AppColor.primaryOriginalColor);}
  static Widget domainRounded({Color? color})    {  return Icon(Icons.domain_rounded,     color: color);}
  static Widget wifiOff({Color? color})    {  return Icon(Icons.wifi_off_outlined,     color: color);}
  static Widget clearIcon({Color? color,double? size})    {  return Icon(Icons.clear,     color: color,size: size,);}

  Widget editOutline                    = Icon(Icons.edit_outlined,                         size:27, color: AppColor.blackOriginalColor,);
  static Widget delete                    = Icon(Icons.delete,                       size: 19, color:  AppColor.primaryOriginalColor,);
  Widget editNote                  = Icon(Icons.edit_note,                    size:27, color:  AppColor.primaryOriginalColor,);
  Widget calendar                  = Icon(FeatherIcons.calendar,              size: 19, color:  AppColor.primaryOriginalColor,);
  static Widget localCity                 = Icon(Icons.location_city,                size:27, color:  AppColor.primaryOriginalColor,);
  Widget cameraAlt                 = Icon(Icons.camera_alt,                   size: 19, color:  AppColor.primaryOriginalColor,);
  static Widget chevronDown               = Icon(EvaIcons.chevronDown,               color: Colors.grey[500],);
  static Widget faceRounded               = Icon(Icons.face_rounded,                 size: 26, color:  AppColor.primaryOriginalColor,);
  static Widget lockRounded               = Icon(Icons.lock_rounded,                 size: 19, color:  AppColor.primaryOriginalColor,);
  Widget badgeRounded              = Icon(Icons.badge_rounded,                size: 19, color:  AppColor.primaryOriginalColor,);
  Widget faceRounded19             = Icon(Icons.face_rounded,                 size: 19, color:  AppColor.primaryOriginalColor,);
  Widget qrCodeOutlined            = Icon(Icons.qr_code_outlined,             size: 19, color:  AppColor.primaryOriginalColor,);
  static Widget peopleAltRounded          = Icon(Icons.people_alt_rounded,           size: 19, color:  AppColor.primaryOriginalColor,);
  static Widget homeWorkOutlined          = Icon(Icons.home_work_outlined,           size: 19, color:  AppColor.primaryOriginalColor,);
  Widget watchLaterRounded         = Icon(Icons.watch_later_rounded,          size: 19, color:  AppColor.primaryOriginalColor,);
  Widget beachAccessRounded        = Icon(Icons.beach_access_rounded,         size: 19, color:  AppColor.primaryOriginalColor,);
  static Widget accountCircleRounded      = Icon(Icons.account_circle_rounded,       size: 26, color:  AppColor.primaryOriginalColor,);
  Widget shareLocationRounded      = Icon(Icons.share_location_rounded,       size: 19, color:  AppColor.primaryOriginalColor,);
  Widget notificationsRounded      = Icon(Icons.notifications_rounded,        size: 26, color:  AppColor.primaryOriginalColor,);
  Widget appRegistrationRounded    = Icon(Icons.app_registration_rounded,     size: 25, color: AppColor.blackOriginalColor.withValues(alpha:0.75), );
  Widget settingsApplicationsSharp = Icon(Icons.settings_applications_sharp,  size: 27, color:  AppColor.primaryOriginalColor,);
  Widget upload                    = Icon(Icons.upload,                       color: Colors.black54);
  static Widget leadsIcon({Color? color})     {  return            Icon(FontAwesome5.comment_dollar,  color: color  );  }
  static Widget handsHelping({Color? color})  {  return            Icon(FontAwesome5.handshake,    color: color  );  }
  static Widget salesPerson({Color? color})  {  return            Icon(FontAwesome5.user_tie,    color: color??AppColor.primaryOriginalColor  );  }
}