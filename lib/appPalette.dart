import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppPalette {
  static const Color red = Colors.red;
  static const Color blood_red = Color(0xFF710000);
  static const Color platinum = Color(0xFFE2E2E2);
  static const Color rich_black = Color(0xFF011C27);
  static const Color burnt_sienna = Color(0xFFE26D5A);
  static const Color caput_mortuum = Color(0xFF51291E);

  static const grey = _GreyColors();
}
class _GreyColors {
  const _GreyColors();

  final darkGrey = const Color(0xFF5C5858);
  final lightGrey = const Color(0xFF888888);
}
