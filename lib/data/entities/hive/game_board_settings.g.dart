// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_board_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameBoardSettingsDbAdapter extends TypeAdapter<GameBoardSettingsDb> {
  @override
  final int typeId = 1;

  @override
  GameBoardSettingsDb read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GameBoardSettingsDb.tiny;
      case 1:
        return GameBoardSettingsDb.classic;
      case 2:
        return GameBoardSettingsDb.big;
      case 3:
        return GameBoardSettingsDb.bigger;
      case 4:
        return GameBoardSettingsDb.huge;
      case 5:
        return GameBoardSettingsDb.hugger;
      default:
        return GameBoardSettingsDb.tiny;
    }
  }

  @override
  void write(BinaryWriter writer, GameBoardSettingsDb obj) {
    switch (obj) {
      case GameBoardSettingsDb.tiny:
        writer.writeByte(0);
        break;
      case GameBoardSettingsDb.classic:
        writer.writeByte(1);
        break;
      case GameBoardSettingsDb.big:
        writer.writeByte(2);
        break;
      case GameBoardSettingsDb.bigger:
        writer.writeByte(3);
        break;
      case GameBoardSettingsDb.huge:
        writer.writeByte(4);
        break;
      case GameBoardSettingsDb.hugger:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameBoardSettingsDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
