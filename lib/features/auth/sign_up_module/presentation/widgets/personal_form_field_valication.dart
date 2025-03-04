import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubi_crm/core_widget/custom_field_component.dart';
import 'package:ubi_crm/theme/text_style.dart';

class FormFieldWithValidation extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final String hintText;
  final int charCount;
  final String errorMessage;
  final bool errorBool;
  final int maxLength;
  final Function(String)? onFieldSubmit; // Change the type here
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged; // Add this
  final String? Function(String?)? validator;

  const FormFieldWithValidation({super.key,
    required this.focusNode,
    required this.controller,
    required this.hintText,
    required this.charCount,
    required this.errorMessage,
    required this.errorBool,
    required this.maxLength,
    this.onFieldSubmit,
    this.keyboardType,
    this.onChanged, // Add this
    this.validator, // Add this
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormFieldComponent(
          focusNode: focusNode,
          controller: controller,
          hintText: hintText,
          suffix: Text('$charCount/$maxLength', style: const TextStyle(fontSize: 12, color: Colors.grey)),
          inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
          underlineBorder: true,
          onFieldSubmit: onFieldSubmit,
          keyboardType: keyboardType,
          onchange: onChanged, // Pass the callback
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          validator: validator,
        ),
        if (!errorBool)
          Text(
            errorMessage,
            style: AppTextStyle.bodyText1SB(color: Colors.red),
          ),
      ],
    );
  }
}