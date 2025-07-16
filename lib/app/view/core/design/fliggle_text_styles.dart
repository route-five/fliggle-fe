import 'package:flutter/material.dart';
import 'package:fliggle/app/view/core/design/fliggle_colors.dart';

class FliggleTextStyles {
  // Title
  static TextStyle stepTitle(BuildContext context) => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: FliggleColors.of(context).text,
      );

  // Subtitle
  static TextStyle stepSubtitle(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: FliggleColors.of(context).disabled,
      );
  
  // (Custom)TextField
  static TextStyle textFieldLabel(BuildContext context) => TextStyle(
        fontSize: 14, // 12 너무 작아서 14로 변경했음
        fontWeight: FontWeight.w400,
        color: FliggleColors.of(context).disabled,
      );
  static TextStyle textFieldHint(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: FliggleColors.of(context).outline,
      );
  static TextStyle textFieldText(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: FliggleColors.of(context).text,
      );

  // Button
  static TextStyle buttonText(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );
}