import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/language_contant/lang/vi_vi.dart';
import 'lang/ar_ar.dart';
import 'lang/en_us.dart';
import 'lang/es_es.dart';
import 'lang/hi_hi.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('tr', 'TR');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'Arabic',
    'English',
    'Spanish',
    'Hindi',
    'Vietnamese'
  ];

  // Supported locales
  // Needs to be same order with langs
  static const locales = [
    Locale('ar', 'AR'),
    Locale('en', 'US'),
    Locale('es', 'ES'),
    Locale('hi', 'HI'),
    Locale('vi', 'VI'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_AR': arAR, // lang/ar_AR.dart
        'en_US': enUS, // lang/en_US.dart
        'es_ES': esES, // lang/es_ES.dart
        'hi_HI': hiHI, // lang/hi_HI.dart
        'vi_VI': viVI, // lang/vi_VI.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String? lang) {
    final locale = _getLocaleFromLanguage(lang)!;
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String? lang) {
    for (int i = 0; i < langs.length; i++){
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }

}
