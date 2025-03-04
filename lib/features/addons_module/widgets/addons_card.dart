
import 'package:flutter/material.dart';

launchMap(String url) async {
  // globalLaunchUrl(url: url);
}


class AddonCard {
  AddonCard(
      {

      this.key,
      this.permissionSts,
      this.sSts,
      this.text,
      this.image,
      this.pageLink,
      this.onTap,
      this.url,
      this.description,
      this.name,
      this.event,
      });


  Key? key;
  bool? permissionSts;
  int? sSts;
  String? text;
  String? image;
  String? description;
  String? url;
  Widget? pageLink;
  Function? onTap;
  String? name;
  String? event;
}



// ignore: must_be_immutable



