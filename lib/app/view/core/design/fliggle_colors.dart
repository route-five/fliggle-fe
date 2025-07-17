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
  FliggleColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? text,
    Color? warning,
    Color? disabled,
    Color? outline,
  }) {
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

  @override
  FliggleColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? text,
    Color? warning,
    Color? disabled,
    Color? outline,
  }) {
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

  @override
  FliggleColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? text,
    Color? warning,
    Color? disabled,
    Color? outline,
  }) {
    return this;
  }

  @override
  FliggleColors lerp(ThemeExtension<FliggleColors>? other, double t) {
    if (other is! FliggleDarkColors) return this;
    return t < 0.5 ? this : other;
  }
}
