import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class FliggleIcons {
  static SvgPicture get(
    String assetName, {
    double size = 32,
    double? width,
    double? height,
    Color? color = Colors.black,
  }) => SvgPicture.asset(
    assetName,
    width: width ?? size,
    height: height ?? size,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );

  static SvgPicture chat({double size = 32, Color color = Colors.black}) =>
      get('assets/icons/chat.svg', size: size, color: color);

  static SvgPicture chatSelected({
    double size = 32,
    Color color = Colors.black,
  }) => get('assets/icons/chat_selected.svg', size: size, color: color);

  static SvgPicture home({double size = 32, Color color = Colors.black}) =>
      get('assets/icons/home.svg', size: size, color: color);

  static SvgPicture homeSelected({
    double size = 32,
    Color color = Colors.black,
  }) => get('assets/icons/home_selected.svg', size: size, color: color);

  static SvgPicture search({double size = 32, Color color = Colors.black}) =>
      get('assets/icons/search.svg', size: size, color: color);

  static SvgPicture searchSelected({
    double size = 32,
    Color color = Colors.black,
  }) => get('assets/icons/search_selected.svg', size: size, color: color);

  static SvgPicture profile({double size = 32, Color color = Colors.black}) =>
      get('assets/icons/profile.svg', size: size, color: color);

  static SvgPicture profileSelected({
    double size = 32,
    Color color = Colors.black,
  }) => get('assets/icons/profile_selected.svg', size: size, color: color);

  static SvgPicture plus({double size = 32, Color color = Colors.black}) =>
      get('assets/icons/plus.svg', size: size, color: color);

  static SvgPicture heart({double size = 32, Color color = Colors.black}) =>
      get('assets/icons/heart.svg', size: size, color: color);

  static SvgPicture heartFull({double size = 32, Color color = Colors.black}) =>
      get('assets/icons/heart_full.svg', size: size, color: color);

  static SvgPicture comment({double size = 32, Color color = Colors.black}) =>
      get('assets/icons/comment.svg', size: size, color: color);

  static SvgPicture commentFull({
    double size = 32,
    Color color = Colors.black,
  }) => get('assets/icons/comment_full.svg', size: size, color: color);
}
