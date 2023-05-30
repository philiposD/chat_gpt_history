import 'dart:ui';

abstract class ThemeDataFactory {
  CustomTheme get theme;
}

class CustomThemeData implements ThemeDataFactory {
  late CustomTheme _theme;

  init() {
    _theme = MainTheme();
  }

  static final CustomThemeData _singleton = CustomThemeData._internal();

  factory CustomThemeData() {
    return _singleton;
  }

  CustomThemeData._internal();

  @override
  CustomTheme get theme => _theme;
}

abstract class CustomTheme {
  final Color darkAccent;
  final Color lightAccent;
  final Color mainGreen;

  CustomTheme(
      {required this.darkAccent,
      required this.mainGreen,
      required this.lightAccent});
}

class MainTheme extends CustomTheme {
  MainTheme()
      : super(
            darkAccent: Color(0xFF343541),
            mainGreen: Color(0xFF19c37d),
            lightAccent: Color(0xFF444654));
}
