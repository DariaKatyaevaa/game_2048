import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/domain/entities/theme_type.dart';
import 'package:game_2048/domain/entities/tile.dart';
import 'package:game_2048/domain/entities/game_board_model.dart';

abstract class IDatabaseDataSource {
  Future<GameBoardModel> getGameBoardState(GameBoardSettings gameBoardSettings);

  Future<void> saveGameBoardState({
    required GameBoardSettings gameBoardSettings,
    int? record,
    int? score,
    List<List<Tile>>? board,
  });

  Future<ThemeType> getThemeType();

  Future<void> saveThemeType(ThemeType themeType);

  Future<void> dispose();
}
