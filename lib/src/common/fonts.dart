import 'package:flutter/material.dart';

class FontesApp {
  static TextStyle textXsmallNormal =
      const TextStyle(fontFamily: 'Helvetica Neue', fontSize: 11);

  static TextStyle textXsmall = const TextStyle(
      fontFamily: 'Helvetica Neue', fontWeight: FontWeight.bold, fontSize: 11);

  static TextStyle textSmall = const TextStyle(
      fontFamily: 'Helvetica Neue', fontWeight: FontWeight.bold, fontSize: 15);

  static TextStyle textMedium = const TextStyle(
      fontFamily: 'Helvetica Neue', fontWeight: FontWeight.bold, fontSize: 20);

  static TextStyle textHeadDrawer = const TextStyle(
      fontFamily: 'Helvetica Neue',
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Colors.white);

  static TextStyle textVersionDrawer = const TextStyle(
      fontFamily: 'Helvetica Neue', fontSize: 12, color: Colors.white);
}
