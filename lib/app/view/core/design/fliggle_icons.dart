import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class FliggleIcons {
  static SvgPicture _get(
    String assetName, {
    double width = 28,
    double height = 28,
    Color color = Colors.black,
  }) => SvgPicture.asset(
    assetName,
    width: width,
    height: height,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
  );

  static SvgPicture chat({
    double width = 28,
    double height = 28,
    Color color = Colors.black,
  }) =>
      _get('assets/icons/chat.svg', width: width, height: height, color: color);

  static SvgPicture chatSelected({
    double width = 28,
    double height = 28,
    Color color = Colors.black,
  }) => _get(
    'assets/icons/chat_selected.svg',
    width: width,
    height: height,
    color: color,
  );

  static SvgPicture home({
    double width = 28,
    double height = 28,
    Color color = Colors.black,
  }) =>
      _get('assets/icons/home.svg', width: width, height: height, color: color);

  static SvgPicture homeSelected({
    double width = 28,
    double height = 28,
    Color color = Colors.black,
  }) => _get(
    'assets/icons/home_selected.svg',
    width: width,
    height: height,
    color: color,
  );

  static SvgPicture search({
    double width = 28,
    double height = 28,
    Color color = Colors.black,
  }) => _get(
    'assets/icons/search.svg',
    width: width,
    height: height,
    color: color,
  );

  static SvgPicture searchSelected({
    double width = 28,
    double height = 28,
    Color color = Colors.black,
  }) => _get(
    'assets/icons/search_selected.svg',
    width: width,
    height: height,
    color: color,
  );

  static SvgPicture profile({
    double width = 28,
    double height = 28,
    Color color = Colors.black,
  }) => _get(
    'assets/icons/profile.svg',
    width: width,
    height: height,
    color: color,
  );

  static SvgPicture profileSelected({
    double width = 28,
    double height = 28,
    Color color = Colors.black,
  }) => _get(
    'assets/icons/profile_selected.svg',
    width: width,
    height: height,
    color: color,
  );
}
