import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class CustomDropDownField<T> extends StatelessWidget {
  final String? label;
  final Widget? prefixIcon;
  final String hintText;
  final List<T> itemList;
  final String Function(T) getItemLabel;
  final Function(T) onChanged;
  final Color borderColor;
  final TextStyle? textStyle;
  final String? Function(T?)? validator;// Added validator

  const CustomDropDownField({
    super.key,
     this.label,
     this.prefixIcon,
    required this.hintText,
    required this.itemList,
    required this.getItemLabel,
    required this.onChanged,
    this.textStyle,
    this.borderColor = Colors.blue,
    this.validator, // Accept validator function
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       if(label!="") Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label.toString(),
              style: AppTextStyle.bodyText6SB(),
            ),
          ],
        ),
        if(label!="") const SizedBox(height: 4),
        DropdownButtonFormField<T>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8
            ),
            hintStyle: GoogleFonts.nunitoSans(
                fontSize: 14,
                color:Colors.black87,
                fontWeight: FontWeight.w500
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:AppColor.primaryOriginalColor, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryOriginalColor, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),

            prefixIcon: prefixIcon
          ),
          hint: Text(
            hintText,
            style: textStyle??GoogleFonts.nunitoSans(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500
            ),

          ),
          items: itemList.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(getItemLabel(item)),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) onChanged(value);
          },
          validator: validator,
          style:  GoogleFonts.nunitoSans(
              fontSize: 14,
              color:Colors.black87,
              fontWeight: FontWeight.w500
          ),
        ),

        /*Container(
          height: 45,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppConfig.appColor),
          ),
          child: Obx(() => DropdownButtonFormField<T>(
              isExpanded: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppConfig.appColor, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppConfig.appColor, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              hint: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  selectedValue,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500
                  ),

                ),
              ),
              items: itemList.map((item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(getItemLabel(item)),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) onChanged(value);
              },
            validator: validator,
            ),
          ),
        ),*/
      ],
    );
  }
}
