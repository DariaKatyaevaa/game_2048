import 'package:game_2048/data/entities/hive/game_board_settings.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'game_board_state.g.dart';

@HiveType(typeId: 2)
class GameBoardStateDb {
  @HiveField(0)
  final GameBoardSettingsDb gameBoardSettings;
  @HiveField(1)
  final List<List<int>>? gameBoard;
  @HiveField(2)
  final int record;
  @HiveField(3)
  final int score;

  GameBoardStateDb({
    required this.gameBoardSettings,
    required this.gameBoard,
    required this.record,
    required this.score,
  });

  GameBoardStateDb copy({
    List<List<int>>? gameBoard,
    int? record,
    int? score,
  }) {
    return GameBoardStateDb(
      gameBoardSettings: gameBoardSettings,
      gameBoard: gameBoard ?? this.gameBoard,
      record: record ?? this.record,
      score: score ?? this.score,
    );
  }
}
