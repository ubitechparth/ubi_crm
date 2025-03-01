import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/theme/text_style.dart';

class LoginTermsAndPrivacyWidget extends StatelessWidget {
  final String? loginText; // To accept the login by sign-up agreement text
  final String? termText; // To accept the term & conditions text
  final String? privacyText; // To accept the privacy policy text
  final GestureTapCallback? onTermTap; // Callback for terms tap
  final GestureTapCallback? onPrivacyTap; // Callback for privacy tap

  const LoginTermsAndPrivacyWidget({
    super.key,
    this.loginText, // Default login text can be passed
    this.termText, // Default term text can be passed
    this.privacyText, // Default privacy text can be passed
    this.onTermTap, // Default callback for term tap
    this.onPrivacyTap, // Default callback for privacy tap
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 250, // Width of the container
        padding: EdgeInsets.only(bottom: 2),
        alignment: Alignment.center, // Align text to center
        child: RichText(
          textAlign: TextAlign.center, // Align the text in the center
          text: TextSpan(
            text: 'continuing_agree_text'.tr, // Default text or passed text
            style: AppTextStyle.loginBySignUpAgree, // Style for the main text
            children: <TextSpan>[
              TextSpan(
                text: termText ?? 'login_Term_Conditions'.tr, // Default term text or passed text
                style: AppTextStyle.termCondition, // Term style
                recognizer: TapGestureRecognizer()..onTap = onTermTap, // Action on tap
              ),
              TextSpan(text: 'login_&'.tr), // Translation for "&" between terms and privacy
              TextSpan(
                text: privacyText ?? 'login_Privacy_Policy'.tr, // Default privacy text or passed text
                style: AppTextStyle.termCondition, // Privacy policy style
                recognizer: TapGestureRecognizer()..onTap = onPrivacyTap, // Action on tap
              ),
            ],
          ),
        ),
      ),
    );
  }
}
