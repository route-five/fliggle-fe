import 'package:flutter/material.dart';
import 'package:fliggle/app/view/core/design/fliggle_text_styles.dart';
import 'package:fliggle/app/view/core/design/fliggle_colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;

  const CustomTextField({super.key, required this.label, required this.hint});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      isFocused = focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    focusNode.removeListener(_handleFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      style: FliggleTextStyles.textFieldText(context),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hint,
        hintStyle: FliggleTextStyles.textFieldHint(context),
        labelStyle: FliggleTextStyles.textFieldLabel(context, isFocused: isFocused),
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
