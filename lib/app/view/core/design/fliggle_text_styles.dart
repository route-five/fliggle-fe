import 'package:flutter/material.dart';

/// Base class for color definitions with ThemeExtension
abstract class FliggleColors extends ThemeExtension<FliggleColors> {
  const FliggleColors();

  static FliggleColors of(BuildContext context) =>
      Theme.of(context).extension<FliggleColors>()!;

  // Common colors
  Color get primary;
  Color get secondary;
  Color get background;
  Color get text;
  Color get warning;
  Color get disabled;
  Color get outline;

  // Added colors from Figma
  Color get border;
  Color get inputBorder;

  @override
  FliggleColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? text,
    Color? warning,
    Color? disabled,
    Color? outline,
    Color? border,
    Color? inputBorder,
  });

  @override
  FliggleColors lerp(ThemeExtension<FliggleColors>? other, double t);
}

/// Shared constant colors used in both light and dark mode
mixin FliggleConstantColors {
  @protected
  Color get warning => const Color(0xFFF88787);

  @protected
  Color get disabled => const Color(0xFF808080);

  @protected
  Color get outline => const Color(0xFFB6B6B6); // Used optionally
}

/// Light theme color implementation
class FliggleLightColors extends FliggleColors with FliggleConstantColors {
  const FliggleLightColors();

  @override
  Color get primary => const Color(0xFF6C98FF);

  @override
  Color get secondary => const Color(0xFF87A9F7);

  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Color get text => const Color(0xFF000000);

  @override
  Color get border => const Color(0xFFE1E1E1);

  @override
  Color get inputBorder => const Color(0xFF808080);

  @override
  FliggleColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? text,
    Color? warning,
    Color? disabled,
    Color? outline,
    Color? border,
    Color? inputBorder,
  }) {
    return this; // You can implement customization if needed
  }

  @override
  FliggleColors lerp(ThemeExtension<FliggleColors>? other, double t) {
    if (other is! FliggleLightColors) return this;
    return t < 0.5 ? this : other;
  }
}

/// Dark theme color implementation
class FliggleDarkColors extends FliggleColors with FliggleConstantColors {
  const FliggleDarkColors();

  @override
  Color get primary => const Color(0xFF497BEE);

  @override
  Color get secondary => const Color(0xFF6C98FF);

  @override
  Color get background => const Color(0xFF17161A);

  @override
  Color get text => const Color(0xFFFFFFFF);

  @override
  Color get border => const Color(0xFF2E333F);

  @override
  Color get inputBorder => const Color(0xFF404654);

  @override
  FliggleColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? text,
    Color? warning,
    Color? disabled,
    Color? outline,
    Color? border,
    Color? inputBorder,
  }) {
    return this; // You can implement customization if needed
  }

  @override
  FliggleColors lerp(ThemeExtension<FliggleColors>? other, double t) {
    if (other is! FliggleDarkColors) return this;
    return t < 0.5 ? this : other;
  }
}