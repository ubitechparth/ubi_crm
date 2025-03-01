import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text; // The text to display
  final Color? textColor; // The text to display
  final TextStyle? style; // Optional custom style for the text
  final TextAlign textAlign; // Optional alignment for the text
  final int? maxLines; // Limit the number of lines
  final TextOverflow overflow; // How overflow is handled (e.g., ellipsis, fade)
  final  FontWeight? fontWeight; // How overflow is handled (e.g., ellipsis, fade)
  final  double? fontSize;


  // Constructor to accept parameters
  const TextWidget({
    super.key,
    required this.text, // Text is required
    this.textColor, // Optional custom style
    this.style, // Optional custom style
    this.textAlign = TextAlign.left, // Default to left alignment
    this.maxLines, // Optional limit on lines
    this.fontWeight, // Optional limit on lines
    this.overflow = TextOverflow.ellipsis, // Default overflow behavior
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign, // Text alignment (left, center, right)
        maxLines: maxLines, // Limit the number of lines
        overflow: overflow,
        style: style??GoogleFonts.nunitoSans(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? Get.width*0.04,
          fontWeight: fontWeight?? FontWeight.w600),

    );// Default style if none is provided

  }
}
