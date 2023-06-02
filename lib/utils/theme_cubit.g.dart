// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_cubit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeSettingAdapter extends TypeAdapter<ThemeSetting> {
  @override
  final int typeId = 1;

  @override
  ThemeSetting read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeSetting.system;
      case 1:
        return ThemeSetting.dark;
      case 2:
        return ThemeSetting.light;
      default:
        return ThemeSetting.system;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeSetting obj) {
    switch (obj) {
      case ThemeSetting.system:
        writer.writeByte(0);
        break;
      case ThemeSetting.dark:
        writer.writeByte(1);
        break;
      case ThemeSetting.light:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeSettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
