// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/app_assets.dart';
import 'package:ubi_crm/core/globals.dart';

// ignore: must_be_immutable
class CountryPicker extends StatefulWidget {
  CountryPicker(
      {super.key,
        this.callBackFunction,
        this.controller,
        this.headerText,
        this.headerBackgroundColor,
        this.headerTextColor});

  final Function? callBackFunction;
  final String? headerText;
  final controller;
  final Color? headerBackgroundColor;
  final Color? headerTextColor;
  bool? isInit = true;

  @override
  CountryPickerState createState() => CountryPickerState();
}

// Country picker state class
class CountryPickerState extends State<CountryPicker> {
  List<CountryModel> countryList = [];
  CountryModel selectedCountryData = const CountryModel();

  var sName;
  var sFlag;
  var sDialCode;
  var sDigit;
  int i = 0;

  late String currentCountryOnChange;

  @override
  void didChangeDependencies() async {
    if (widget.isInit!) {
      widget.isInit = false;
      final data = await DefaultAssetBundle.of(context)
          .loadString(AppAssets.json.countryCodes);
      setState(() {
        countryList = parseJson(data)!;
        if (widget.controller!=null && widget.controller.isNotEmpty) {
          currentCountry.value = widget.controller;

        }
        for (var selected in countryList) {
          if (selected.name == currentCountry.value) {
            selectedCountryData = countryList[i];
            i = 0;
          } else if (currentCountry.value == '') {
            selectedCountryData = countryList[0];
            setState(() {
              currentCountryOnChange = selectedCountryData.name!;
            });
          }
          i++;
        }

      });
      widget.callBackFunction!(
        selectedCountryData.name,
        selectedCountryData.dialCode,
        selectedCountryData.flag,
        selectedCountryData.digit,
        selectedCountryData.timeZone,
      );
    }
    super.didChangeDependencies();
  }

  // parse json data into model
  List<CountryModel>? parseJson(String response) {
    // ignore: unnecessary_null_comparison
    if (response == null) {
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed
        .map<CountryModel>(
            (json) => CountryModel.fromJson(json as Map<String, dynamic>))
        .toList() as List<CountryModel>;
  }

  //build method for UI render
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        showDialogue(context);
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            // ignore: unnecessary_null_comparison
            selectedCountryData != null
                ? selectedCountryData.flag.toString()
                : '',
            textScaler: TextScaler.linear(1),
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Nunito Sans',// Adjust font size
              fontWeight: FontWeight.w500, // Make text bold
            ),
          ),
          const SizedBox(
            height: 10,
            width: 6,
          ),
          // ignore: unnecessary_null_comparison
          Text(
            selectedCountryData != (null)
                ? selectedCountryData.dialCode.toString()
                : '',
            textScaler: TextScaler.linear(1),
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Nunito Sans',// Adjust font size
              fontWeight: FontWeight.w500, // Make text bold
            ),
          ),
          const SizedBox(
            height: 10,
            width: 6,
          ),
            /*       Icon(
            FeatherIcons.chevronDown,
            size: Get.height * 0.03,
            color: Colors.black87.withValues(alpha: 0.7),
            //size: 25,

          )*/
        ],
      ),
    );
  }

  // show country picker dialogue
  Future<void> showDialogue(context) async {
    final countryData = await showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        searchList: countryList,
        callBackFunction: widget.callBackFunction,
        headerText: widget.headerText,
        headerBackgroundColor: widget.headerBackgroundColor,
        headerTextColor: widget.headerTextColor,
      ),
    );
    if (countryData != null) {
      selectedCountryData = countryData as CountryModel;
    }
    setState(() {});
  }
}

// Custom stateful widget dialogue

class CustomDialog extends StatefulWidget {
  const CustomDialog(
      {super.key,
        @required this.searchList,
        @required this.callBackFunction,
        this.headerText,
        this.headerBackgroundColor,
        this.headerTextColor});

  final List<CountryModel>? searchList;
  final Function? callBackFunction;
  final String? headerText;
  final Color? headerBackgroundColor;
  final Color? headerTextColor;

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

// dialogue state class
class _CustomDialogState extends State<CustomDialog> {
  List<CountryModel> tmpList = [];

  // dialogue inner widget
  Widget dialogContent(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Picker Header
          Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: widget.headerBackgroundColor ??
                    Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                )),
            child: Stack(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.headerText ?? 'select_country'.tr,
                    style: TextStyle(
                        fontSize: Get.height * 0.023,
                        color: widget.headerTextColor ?? Colors.white),
                    textScaler: const TextScaler.linear(1),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkResponse(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'NewCancelText'.tr,
                      style: TextStyle(
                          fontSize: Get.height * 0.023,
                          color: widget.headerTextColor ?? Colors.white),
                      textScaler: const TextScaler.linear(1),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            height: 45,
            decoration: BoxDecoration(
              color: const Color.fromARGB(8, 0, 0, 0),
              borderRadius: BorderRadius.circular(36),
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'onSignUpWithOtpSearchCountry'.tr,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 14.0),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 18.0,
                    color: Colors.black38,
                  )),
              onChanged: filterData,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: sdk_version_ui_as_code
                  ...tmpList.map(
                        (item) => Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context, item);
                          widget.callBackFunction!(
                              item.name, item.dialCode, item.flag, item.digit,item.timeZone);
                        },
                        canRequestFocus: true,
                        focusColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade300,
                        autofocus: true,
                        hoverColor: Colors.grey.shade300,
                        splashColor: Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.flag!,
                                style: TextStyle(
                                    fontSize: Get.height * 0.023,
                                    color: Colors.black),
                                textScaler: const TextScaler.linear(1),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Text(
                                  item.name!,
                                  style: TextStyle(
                                      fontSize: Get.height * 0.022,
                                      color: Colors.black),
                                  textScaler: const TextScaler.linear(1),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                item.dialCode!,
                                style: TextStyle(
                                    fontSize: Get.height * 0.022,
                                    color: Colors.black),
                                textScaler: const TextScaler.linear(1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // fliter data on search bar text change
  void filterData(String text) {
    //print("Change");
    tmpList = [];
    if (text == '') {
      tmpList.addAll(widget.searchList!);
    } else {
      for (var userDetail in widget.searchList!) {
        if (userDetail.name!.toLowerCase().contains(text.toLowerCase())) {
          tmpList.add(userDetail);
        }
      }
    }
    setState(() {});
  }

  // initiation of state
  @override
  void initState() {
    super.initState();
    tmpList = widget.searchList!;
  }

  // build method
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

//country model
class CountryModel {
  const CountryModel(
      {this.name, this.dialCode, this.code, this.flag, this.digit,this.timeZone});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    final flag = CountryModel.getEmojiFlag(json['code'] as String);
    return CountryModel(
        name: json['name'],
        dialCode: json['dial_code'],
        code: json['code'],
        flag: flag,
        digit: json['digit'],
        timeZone: json['timeZone']
    );
  }

  final String? name, dialCode, code, flag, digit,timeZone;

  //Converting country code into emoji flag
  static String getEmojiFlag(String emojiString) {
    const flagOffset = 0x1F1E6;
    const asciiOffset = 0x41;

    final firstChar = emojiString.codeUnitAt(0) - asciiOffset + flagOffset;
    final secondChar = emojiString.codeUnitAt(1) - asciiOffset + flagOffset;

    return String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
  }
}
