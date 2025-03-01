import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class CustomFormFieldComponent extends StatelessWidget {
  const CustomFormFieldComponent({
    super.key,
    this.controller,
    this.border,
    this.hintText,
    this.suffix,
    this.inputFormatters,
    this.validator,
    this.enabled,
    this.keyboardType,
    this.onchange,
    this.prefix,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.onFieldSubmit,
    this.backgroundColor,
    this.textScaleFactor,
    this.onSaved,
    this.onTap,
    this.obscureText,
    this.labelText,
    this.color,
    this.contentPadding,
    this.maxLength,
    this.enableInteractiveSelection,
    this.textCapitalization,
    this.autovalidateMode,
    this.textStyle,
    this.maxLines,
    this.overflow,
    this.readOnly,
    this.focusNode,
    this.counter,
    this.underlineBorder,
    this.filled,
    this.textAlign,
    this.hintStyle,
    this.textAlignVertical,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final bool? enabled;
  final bool? underlineBorder;
  final InputBorder? border;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Function(String)? onchange;
  final Function(String)? onFieldSubmit;
  final Function(String?)? onSaved;
  final GestureTapCallback? onTap;
  final double? textScaleFactor;
  final String? labelText;
  final Widget? counter;
  final Color? color;
  final Color? backgroundColor;
  final Color? prefixIconColor;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final bool? enableInteractiveSelection;
  final TextCapitalization? textCapitalization;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? readOnly;
  final bool? filled;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      textAlign: textAlign??TextAlign.start,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle:AppTextStyle.hindTextFieldText ,
          counter: counter,
          prefixIcon: prefixIcon,
          prefixIconColor:enabled==true?prefixIconColor??AppColor.primaryOriginalColor:Colors.grey,
          focusedBorder:underlineBorder==true
              ? const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))
              : OutlineInputBorder(
            borderSide: BorderSide(
              color: color == null ? AppColor.primaryOriginalColor : color!,
              style: BorderStyle.solid,
              width: 1,
            ),
            gapPadding:0.1
          ),
          enabledBorder: underlineBorder==true
              ? const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))
              : OutlineInputBorder(borderSide: BorderSide(color: color == null ? AppColor.primaryOriginalColor : color!,)),
          border: underlineBorder==true
              ? const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))
              : const OutlineInputBorder(),
          suffix: suffix,
          suffixIcon: suffixIcon,
          contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          hintText: hintText,
          hintStyle: hintStyle??AppTextStyle.hindTextFieldText,
          errorMaxLines: 2,
        prefix: prefix,
        filled: filled??false,
        fillColor: backgroundColor,
      ),
      onFieldSubmitted: onFieldSubmit,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText??false,
      onChanged: onchange,
      enabled: enabled,
      onSaved: onSaved,
      validator: validator,
      maxLength: maxLength,
      enableInteractiveSelection: enableInteractiveSelection,
      textCapitalization: textCapitalization?? TextCapitalization.none,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
      style: textStyle??GoogleFonts.nunitoSans(
        fontSize: 14,
        color: enabled==false?  Colors.black45: Colors.black87.withValues(alpha:0.8),
        fontWeight: FontWeight.w500
      ),
      maxLines: maxLines??1,
      readOnly: readOnly??false,
      onTap: onTap,
      textAlignVertical: textAlignVertical,

    );
  }
}