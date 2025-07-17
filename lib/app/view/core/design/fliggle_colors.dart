import 'package:flutter/material.dart';

abstract class FliggleColors extends ThemeExtension<FliggleColors> {
  const FliggleColors();

  static FliggleColors of(BuildContext context) =>
      Theme.of(context).extension<FliggleColors>()!;

  Color get primary;
  Color get secondary;
  Color get background;
  Color get text;
  
  Color get warning;
  Color get disabled;
  Color get outline;

  @override
  FliggleColors copyWith({ Color? primary, Color? secondary, Color? background, Color? text, Color? warning, Color? disabled, Color? outline }) {
    // Delegated to concrete classes
    return this;
  }

  @override
  FliggleColors lerp(ThemeExtension<FliggleColors>? other, double t) {
    if (other is! FliggleColors) return this;
    // No interpolation: pick based on t
    return t < 0.5 ? this : other;
  }
}

mixin FliggleConstantColors {
  @protected
  Color get warning => const Color(0xFFF88787);

  @protected
  Color get disabled => const Color(0xFF808080);

  @protected
  Color get outline => const Color(0xFFB6B6B6);
}

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

  // Gray palette for light theme
  Color get gray50 => const Color(0xFFF6F6F6);
  Color get gray100 => const Color(0xFFE7E7E7);
  Color get gray200 => const Color(0xFFD1D1D1);
  Color get gray300 => const Color(0xFFB0B0B0);
  Color get gray400 => const Color(0xFF888888);
  Color get gray500 => const Color(0xFF6D6D6D);
  Color get gray600 => const Color(0xFF5D5D5D);
  Color get gray700 => const Color(0xFF4F4F4F);
  Color get gray800 => const Color(0xFF454545);
  Color get gray900 => const Color(0xFF3D3D3D);
  Color get gray950 => const Color(0xFF0E0E0E);

  @override
  FliggleColors copyWith({ Color? primary, Color? secondary, Color? background, Color? text, Color? warning, Color? disabled, Color? outline }) {
    return this;
  }

  @override
  FliggleColors lerp(ThemeExtension<FliggleColors>? other, double t) {
    if (other is! FliggleLightColors) return this;
    return t < 0.5 ? this : other;
  }
}

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

  // Gray palette for dark theme (reverse mapping)
  Color get gray50 => const Color(0xFF0E0E0E);
  Color get gray100 => const Color(0xFF3D3D3D);
  Color get gray200 => const Color(0xFF454545);
  Color get gray300 => const Color(0xFF4F4F4F);
  Color get gray400 => const Color(0xFF5D5D5D);
  Color get gray500 => const Color(0xFF6D6D6D);
  Color get gray600 => const Color(0xFF888888);
  Color get gray700 => const Color(0xFFB0B0B0);
  Color get gray800 => const Color(0xFFD1D1D1);
  Color get gray900 => const Color(0xFFE7E7E7);
  Color get gray950 => const Color(0xFFF6F6F6);

  @override
  FliggleColors copyWith({ Color? primary, Color? secondary, Color? background, Color? text, Color? warning, Color? disabled, Color? outline }) {
    return this;
  }

  @override
  FliggleColors lerp(ThemeExtension<FliggleColors>? other, double t) {
    if (other is! FliggleDarkColors) return this;
    return t < 0.5 ? this : other;
  }
}