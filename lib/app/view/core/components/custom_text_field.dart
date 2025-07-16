import 'package:flutter/material.dart';
import 'package:fliggle/app/view/core/design/fliggle_text_styles.dart';
import 'package:fliggle/app/view/core/design/fliggle_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;

  const CustomTextField({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextField(
      style: FliggleTextStyles.textFieldText(context),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hint,
        hintStyle: FliggleTextStyles.textFieldHint(context),
        labelStyle: FliggleTextStyles.textFieldLabel(context),
        focusColor: FliggleColors.of(context).primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: FliggleColors.of(context).disabled, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: FliggleColors.of(context).disabled, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: FliggleColors.of(context).primary, width: 1),
        ),
      ),
    );
  }
}
