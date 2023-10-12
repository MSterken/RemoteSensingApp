
import 'package:flutter/material.dart';

abstract class ColorPalette {
  static const Color red = Colors.red;
  static const Color bloodRed = Color(0xFF710000);
  static const Color platinum = Color(0xFFE2E2E2);
  static const Color richBlack = Color(0xFF011C27);
  static const Color burntSienna = Color(0xFFE26D5A);
  static const Color caputMortuum = Color(0xFF51291E);

  static const grey = _GreyColors();
}
class _GreyColors {
  const _GreyColors();

  final darkGrey = const Color(0xFF5C5858);
  final lightGrey = const Color(0xFF888888);
}
