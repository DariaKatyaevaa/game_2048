// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_board_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameBoardStateDbAdapter extends TypeAdapter<GameBoardStateDb> {
  @override
  final int typeId = 2;

  @override
  GameBoardStateDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameBoardStateDb(
      gameBoardSettings: fields[0] as GameBoardSettingsDb,
      gameBoard: (fields[1] as List?)?.map((dynamic e) => (e as List).cast<int>()).toList(),
      record: fields[2] as int,
      score: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GameBoardStateDb obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.gameBoardSettings)
      ..writeByte(1)
      ..write(obj.gameBoard)
      ..writeByte(2)
      ..write(obj.record)
      ..writeByte(3)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameBoardStateDbAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
