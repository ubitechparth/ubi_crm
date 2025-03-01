import 'package:flutter/material.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class WorldNo1TextWidget extends StatelessWidget {
  // Constructor to take in customizations for font size and text color if needed
  final double fontSize;

  const WorldNo1TextWidget({
    super.key,
    this.fontSize = 0.065, // Default font size as a percentage of screen width
  });

  @override
  Widget build(BuildContext context) {
    return
         Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Selling made ', // Translated text
                style: AppTextStyle.extraHeading5B()

              ),
              TextSpan(
                text: 'Simple', // Translated text
                style: AppTextStyle.extraHeading5B(color: AppColor.primaryOriginalColor)

              ),
            ],
          ),
        ),

      ],
    )
        ;
  }
}
