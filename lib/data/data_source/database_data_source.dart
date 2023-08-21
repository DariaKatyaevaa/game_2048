import 'package:game_2048/data/entities/hive/game_board_settings.dart';
import 'package:game_2048/data/entities/hive/game_board_state.dart';
import 'package:game_2048/data/entities/hive/theme_type.dart';
import 'package:game_2048/data/mappers/game_board_settings_mapper.dart';
import 'package:game_2048/data/mappers/theme_type_mapper.dart';
import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/domain/entities/theme_type.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:game_2048/domain/entities/tile.dart';
import 'package:game_2048/data/data_source/interface/i_database_data_source.dart';
import 'package:game_2048/domain/entities/game_board_model.dart';

class DatabaseDataSource extends IDatabaseDataSource {
  static const _gameBoardStateTag = 'gameBoard';
  static const _themeTypeTag = 'themeType';
  static late final Box<GameBoardStateDb> _gameBoardBox;
  static late final Box<ThemeTypeDb> _themeTypeBox;

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(GameBoardSettingsDbAdapter());
    Hive.registerAdapter(GameBoardStateDbAdapter());
    Hive.registerAdapter(ThemeTypeDbAdapter());
    _gameBoardBox = await Hive.openBox<GameBoardStateDb>(_gameBoardStateTag);
    _themeTypeBox = await Hive.openBox<ThemeTypeDb>(_themeTypeTag);
  }

  @override
  Future<void> saveGameBoardState({
    required GameBoardSettings gameBoardSettings,
    int? record,
    int? score,
    List<List<Tile>>? board,
  }) async {
    await _gameBoardBox.put(
      gameBoardSettings.index,
      GameBoardStateDb(
        gameBoardSettings: gameBoardSettings.toHive(),
        gameBoard: board?.map((row) => row.map((tile) => tile.value).toList()).toList(),
        record: record ?? 0,
        score: score ?? 0,
      ),
    );
  }

  @override
  Future<GameBoardModel> getGameBoardState(GameBoardSettings gameBoardSettings) async {
    var state = _gameBoardBox.values.where((game) => game.gameBoardSettings == gameBoardSettings.toHive()).firstOrNull;
    return GameBoardModel(
      gameBoardSettings: gameBoardSettings,
      record: state?.record ?? 0,
      gameBoardModel: state?.gameBoard,
      score: state?.score ?? 0,
    );
  }

  @override
  Future<ThemeType> getThemeType() async => _themeTypeBox.values.firstOrNull?.fromHive() ?? ThemeType.blue;

  @override
  Future<void> saveThemeType(ThemeType themeType) async => await _themeTypeBox.put(0, themeType.toHive());

  @override
  Future<void> dispose() async {
    await _gameBoardBox.close();
    await _themeTypeBox.close();
  }
}
