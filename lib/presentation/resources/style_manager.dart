import 'package:clean_architect/presentation/resources/color_manager.dart';
import 'package:clean_architect/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  Color color,
  FontWeight fontWeight,
) {
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color);
}

TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontManager.fontFamily,
  Color color = ColorManager.text,
}) {
  return _getTextStyle(fontSize, fontFamily, color, FontWeightManager.regular);
}

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontManager.fontFamily,
  Color color = ColorManager.text,
}) {
  return _getTextStyle(fontSize, fontFamily, color, FontWeightManager.light);
}

TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  Color color = ColorManager.text,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    color,
    FontWeightManager.bold,
  );
}

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  Color color = ColorManager.text,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    color,
    FontWeightManager.semiBold,
  );
}

TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  Color color = ColorManager.text,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.fontFamily,
    color,
    FontWeightManager.medium,
  );
}
