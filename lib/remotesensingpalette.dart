import 'package:flutter/material.dart';

const MaterialColor remoteSensingPalette = MaterialColor(_remoteSensingPalettePrimaryValue, <int, Color>{
  50: Color(0xFFEEE0E0),
  100: Color(0xFFD4B3B3),
  200: Color(0xFFB88080),
  300: Color(0xFF9C4D4D),
  400: Color(0xFF862626),
  500: Color(_remoteSensingPalettePrimaryValue),
  600: Color(0xFF690000),
  700: Color(0xFF5E0000),
  800: Color(0xFF540000),
  900: Color(0xFF420000),
});
const int _remoteSensingPalettePrimaryValue = 0xFF710000;

const MaterialColor remoteSensingPaletteAccent = MaterialColor(_remoteSensingPaletteAccentValue, <int, Color>{
  100: Color(0xFFFF7777),
  200: Color(_remoteSensingPaletteAccentValue),
  400: Color(0xFFFF1111),
  700: Color(0xFFF60000),
});
const int _remoteSensingPaletteAccentValue = 0xFFFF4444;