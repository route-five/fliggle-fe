import 'package:flutter/material.dart';
import 'package:fliggle/app/view/core/design/fliggle_colors.dart';

class FliggleTextStyles {
  // Title (e.g. 게시글 작성)
  static TextStyle titleLarge(BuildContext context) => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: FliggleColors.of(context).text,
      );

  // 본문용 텍스트 (TextField 내부 및 hint)
  static TextStyle bodyMedium(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: FliggleColors.of(context).text,
      );

  // 버튼 텍스트 스타일 (흰색은 .copyWith(color: Colors.white)로 처리)
  static TextStyle labelLarge(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: FliggleColors.of(context).text,
      );

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
  static TextStyle textFieldLabel(BuildContext context, {bool isFocused = false}) => TextStyle(
        fontSize: 14, // 12 너무 작아서 14로 변경했음
        fontWeight: FontWeight.w400,
        color: isFocused
            ? FliggleColors.of(context).primary
            : FliggleColors.of(context).disabled,
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