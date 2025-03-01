import 'package:flutter/material.dart';

class LanguageSelectionCardModel {

  Gradient? id;
  String? locale;
  String? councode;
  String? languageTitle;
  Color? background;
  String? illustration;
  bool? isSelected;

  LanguageSelectionCardModel({
    this.id,
    this.locale,
    this.councode,
    this.languageTitle,
    this.background,
    this.illustration,
    this.isSelected
  });

  LanguageSelectionCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    councode = json['councode'];
    languageTitle = json['languageTitle'];
    background = json['background'];
    illustration = json['illustration'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['locale'] = locale;
    data['councode'] = councode;
    data['languageTitle'] = languageTitle;
    data['background'] = background;
    data['illustration'] = illustration;
    data['isSelected'] = isSelected;
    return data;
  }

}