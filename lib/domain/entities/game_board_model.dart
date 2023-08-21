import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/domain/entities/tile.dart';

final class GameBoardModel {
  final int record;
  final int score;
  final GameBoardSettings gameBoardSettings;
  final List<List<int>>? gameBoardModel;

  GameBoardModel({
    required this.gameBoardSettings,
    required this.record,
    required this.score,
    required this.gameBoardModel,
  });

  List<List<Tile>>? toTile() {
    return gameBoardModel
        ?.asMap()
        .map<int, List<Tile>>(
          (row, list) => MapEntry(
            row,
            list
                .asMap()
                .map<int, Tile>(
                  (column, value) => MapEntry(
                    column,
                    Tile(
                      row: row,
                      column: column,
                      value: value,
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        )
        .values
        .toList();
  }
}
