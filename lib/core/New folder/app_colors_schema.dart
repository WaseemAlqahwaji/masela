import 'package:fluent_ui/fluent_ui.dart';

part 'material_colors.dart';

abstract class AppColorScheme {
  Brightness get brightness;

  TextColors get textColors;

  StatusColors get statusColors;

  ShapeColors get shapeColors;

  MainColor get primaryColor => MainColor(0xffDB9107, {});
}

class AppLightColor extends AppColorScheme {
  @override
  Brightness get brightness => Brightness.light;

  @override
  StatusColors get statusColors => StatusColors(
        red: Color(0xffB83400),
        blue: Color(0xff005FB8),
      );

  @override
  TextColors get textColors => TextColors(
      black: MainColor(
        0xff1B1B1B,
        {},
      ),
      grey: MainColor(0xff646464, {}));

  @override
  ShapeColors get shapeColors => ShapeColors(
        backgroundColor: MainColor(0xffF3F3F3, {}),
        dividerColor: MainColor(0xffEBEBEB, {}),
        cardColor: MainColor(0xffFBFBFB, {}),
        iconColor: MainColor(0xff1A1A1A, {}),
      );
}
