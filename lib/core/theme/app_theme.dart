import 'package:fluent_ui/fluent_ui.dart';

import 'app_colors_schema.dart';

class AppTheme {
  final AppColorScheme _appColorScheme;

  AppTheme(this._appColorScheme);

  AppColorScheme get appColorScheme => _appColorScheme;

  FluentThemeData getThemeData() {
    return FluentThemeData(
      typography: Typography.fromBrightness(
        brightness: appColorScheme.brightness,
      ),
      brightness: appColorScheme.brightness,
      scaffoldBackgroundColor: appColorScheme.shapeColors.backgroundColor,
      cardColor: appColorScheme.shapeColors.cardColor,
      toggleSwitchTheme: ToggleSwitchThemeData(),
      accentColor: AccentColor(
        'primary',
        {
          'primary': appColorScheme.primaryColor,
          'normal': appColorScheme.primaryColor
        },
      ),
    );
  }
}

extension GetAppColorTheme on FluentThemeData {
  AppTheme appTheme([Brightness? brightness]) {
    late AppColorScheme appColorScheme;
    if ((brightness ?? this.brightness) == Brightness.light) {
      appColorScheme = AppLightColor();
    } else {
      appColorScheme = AppLightColor();
    }
    return AppTheme(appColorScheme);
  }

  AppColorScheme get appColors {
    return appTheme().appColorScheme;
  }

  Color customColorMode({
    required Color inDarkMode,
    required Color inLightMode,
  }) =>
      brightness == Brightness.light ? inLightMode : inDarkMode;
}
