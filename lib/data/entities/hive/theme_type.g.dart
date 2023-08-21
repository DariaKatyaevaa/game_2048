// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeTypeDbAdapter extends TypeAdapter<ThemeTypeDb> {
  @override
  final int typeId = 0;

  @override
  ThemeTypeDb read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeTypeDb.green;
      case 1:
        return ThemeTypeDb.blue;
      case 2:
        return ThemeTypeDb.purple;
      default:
        return ThemeTypeDb.green;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeTypeDb obj) {
    switch (obj) {
      case ThemeTypeDb.green:
        writer.writeByte(0);
        break;
      case ThemeTypeDb.blue:
        writer.writeByte(1);
        break;
      case ThemeTypeDb.purple:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeTypeDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
