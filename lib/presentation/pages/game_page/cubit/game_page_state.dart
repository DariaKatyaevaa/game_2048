import 'package:game_2048/domain/entities/game_board.dart';

class GamePageState {
  final GameBoard gameBoard;
  final GameBoard? previousGameBoard;
  final bool isGameOver;
  final bool isNewRecord;
  final bool isVictory;
  final bool isContinue;
  final int record;

  GamePageState({
    required this.gameBoard,
    this.previousGameBoard,
    this.isGameOver = false,
    this.isNewRecord = false,
    this.isVictory = false,
    this.isContinue = false,
    this.record = 0,
  });

  GamePageState copyWith({
    GameBoard? gameBoard,
    GameBoard? previousGameBoard,
    int? record,
    bool? isGameOver,
    bool? isVictory,
    bool? isNewRecord,
    bool? isContinue,
  }) =>
      GamePageState(
        gameBoard: gameBoard ?? this.gameBoard,
        previousGameBoard: previousGameBoard ?? this.previousGameBoard,
        record: record ?? this.record,
        isGameOver: isGameOver ?? this.isGameOver,
        isNewRecord: isNewRecord ?? this.isNewRecord,
        isVictory: isVictory ?? this.isVictory,
        isContinue: isContinue ?? this.isContinue,
      );
}
