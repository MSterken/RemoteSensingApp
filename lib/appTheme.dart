import 'package:flutter/material.dart';
import 'appColorsExtension.dart';
import 'colorPalette.dart';

class AppTheme with ChangeNotifier implements ColorPalette{

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode){
    _themeMode = themeMode;
    notifyListeners();
  }
  //
  // Light theme
  //
  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
    ],
  );

  static final _lightAppColors = AppColorsExtension(
    primary: ColorPalette.bloodRed,
    secondary: ColorPalette.burntSienna,
//    background: ColorPalette.platinum,
    background: Colors.amber,
    onBackground: ColorPalette.richBlack
  );

  //
  // Dark theme
  //

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
  );

  static final _darkAppColors = AppColorsExtension(
    primary: ColorPalette.burntSienna,
    secondary: ColorPalette.burntSienna,
    background: ColorPalette.richBlack,
    onBackground: ColorPalette.platinum
  );


}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}
