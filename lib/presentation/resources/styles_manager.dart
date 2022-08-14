import 'package:flutter/material.dart';

import 'fonts_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, Color color, FontWeight fontWeight) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight);
}

//? return reguler style
TextStyle regualerTextStyle(
    {double fontSize = FontSizeMgr.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, color, FontWeightMgr.reguler);
}

//? return Bold style
TextStyle boldTextStyle(
    {double fontSize = FontSizeMgr.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, color, FontWeightMgr.bold);
}

//? return semiBold style
TextStyle semiBoldTextStyle(
    {double fontSize = FontSizeMgr.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, color, FontWeightMgr.semiBold);
}

//? return light style
TextStyle lightTextStyle(
    {double fontSize = FontSizeMgr.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, color, FontWeightMgr.light);
}

//? return medium style
TextStyle mediumTextStyle(
    {double fontSize = FontSizeMgr.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, color, FontWeightMgr.medium);
}
