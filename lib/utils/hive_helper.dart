// ignore_for_file: constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:owlmarket_qa_connect/utils/theme_cubit.dart';

const String BOX_PREFS = 'box_prefs';

const String PREF_THEME_SETTING = 'pref_theme_setting';

const String PREF_ = 'pref_locale_setting';

class HiveHelper {
  late final Box _prefs;

  Future init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ThemeSettingAdapter());

    _prefs = await Hive.openBox(BOX_PREFS);
  }

  ThemeSetting getThemeSetting() {
    return _prefs.get(PREF_THEME_SETTING, defaultValue: ThemeSetting.system);
  }

  Future setThemeSetting(ThemeSetting theme) {
    return _prefs.put(PREF_THEME_SETTING, theme);
  }
}
