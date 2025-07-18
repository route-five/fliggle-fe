import 'package:flutter/material.dart';

abstract class FliggleColors extends ThemeExtension<FliggleColors> {
  const FliggleColors();

  static FliggleColors of(BuildContext context) =>
      Theme.of(context).extension<FliggleColors>() ??
      const FliggleLightColors();

  Color get primary;
  Color get secondary;
  Color get background;
  Color get text;
  Color get border;

  Color get warning;
  Color get disabled;
  Color get outline;

  @override
  FliggleColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? text,
    Color? border,
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
  Color get outline => const Color(0xFFB6B6B6);
}

class FliggleLightColors extends FliggleColors with FliggleConstantColors {
  const FliggleLightColors({
    this.primary = const Color(0xFF6C98FF),
    this.secondary = const Color(0xFF87A9F7),
    this.background = const Color(0xFFFFFFFF),
    this.text = const Color(0xFF000000),
    this.border = const Color(0xFFE1E1E1),
    this.disabled = const Color(0xFF808080),
  });

  @override
  final Color primary;

  @override
  final Color secondary;

  @override
  final Color background;

  @override
  final Color text;

  @override
  final Color border;

  @override
  final Color disabled;

  @override
  FliggleColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? text,
    Color? border,
    Color? warning,
    Color? disabled,
    Color? outline,
  }) {
    return FliggleLightColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      text: text ?? this.text,
      border: border ?? this.border,
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  FliggleColors lerp(ThemeExtension<FliggleColors>? other, double t) {
    if (other is! FliggleLightColors) return this;
    return t < 0.5 ? this : other;
  }
}

class FliggleDarkColors extends FliggleColors with FliggleConstantColors {
  const FliggleDarkColors({
    this.primary = const Color(0xFF497BEE),
    this.secondary = const Color(0xFF6C98FF),
    this.background = const Color(0xFF17161A),
    this.text = const Color(0xFFFFFFFF),
    this.border = const Color(0xFF2E333F),
    this.disabled = const Color(0xFF404654),
  });

  @override
  final Color primary;

  @override
  final Color secondary;

  @override
  final Color background;

  @override
  final Color text;

  @override
  final Color border;

  @override
  final Color disabled;

  @override
  FliggleColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? text,
    Color? border,
    Color? warning,
    Color? disabled,
    Color? outline,
  }) {
    return FliggleDarkColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      text: text ?? this.text,
      border: border ?? this.border,
      disabled: disabled ?? this.disabled,
    );
  }

  @override
  FliggleColors lerp(ThemeExtension<FliggleColors>? other, double t) {
    if (other is! FliggleDarkColors) return this;
    return t < 0.5 ? this : other;
  }
}
