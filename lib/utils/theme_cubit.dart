// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:owlmarket_qa_connect/utils/color_schemes.g.dart';
import 'package:owlmarket_qa_connect/utils/hive_helper.dart';

part 'theme_cubit.g.dart';

@HiveType(typeId: 1)
enum ThemeSetting {
  @HiveField(0)
  system,
  @HiveField(1)
  dark,
  @HiveField(2)
  light,
}

typedef BrightnessProvider = Brightness Function();

class ThemeCubit extends Cubit<ThemeData> {
  final log = Logger('ThemeCubit');
  final HiveHelper hive;
  final BrightnessProvider brightnessProvider;

  ThemeCubit({
    required this.hive,
    required this.brightnessProvider,
  }) : super(lightTheme);

  static ThemeSetting realTheme = ThemeSetting.light;

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      surfaceTintColor: darkColorScheme.background,
      backgroundColor: darkColorScheme.background,
    ),
    sliderTheme: SliderThemeData(
      valueIndicatorColor: darkColorScheme.primary,
      valueIndicatorTextStyle: TextStyle(
        color: darkColorScheme.onPrimary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: darkColorScheme.background,
      filled: true,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      surfaceTintColor: lightColorScheme.background,
      backgroundColor: lightColorScheme.background,
    ),
    sliderTheme: SliderThemeData(
      valueIndicatorColor: lightColorScheme.primary,
      valueIndicatorTextStyle: TextStyle(
        color: lightColorScheme.onPrimary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: lightColorScheme.background,
      filled: true,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  static bool get isLight => ThemeCubit.realTheme == ThemeSetting.light;

  void initialize() {
    emitTheme(hive.getThemeSetting());
  }

  Future updateTheme(ThemeSetting theme) async {
    log.fine('updateTheme: ${theme.toString()}');
    if (theme != hive.getThemeSetting()) {
      await hive.setThemeSetting(theme);
      emitTheme(theme);
    }
  }

  void emitTheme(ThemeSetting setting) {
    log.fine('emitTheme: ${setting.toString()}');
    if (setting == ThemeSetting.system) {
      var brightness = brightnessProvider();
      log.fine('brightness: ${brightness.toString()}');
      if (brightness == Brightness.dark && realTheme != ThemeSetting.dark) {
        realTheme = ThemeSetting.dark;
        emit(darkTheme);
      } else if (brightness == Brightness.light &&
          realTheme != ThemeSetting.light) {
        realTheme = ThemeSetting.light;
        emit(lightTheme);
      }
    } else {
      if (realTheme != setting) {
        realTheme = setting;
        if (setting == ThemeSetting.light) {
          emit(lightTheme);
        } else {
          emit(darkTheme);
        }
      }
    }
  }

  @visibleForTesting
  static void setCurrentTheme(ThemeSetting setting) {
    realTheme = setting;
  }
}
