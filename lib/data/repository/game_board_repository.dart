import 'package:game_2048/domain/data_interfaces/i_game_board_repository.dart';
import 'package:game_2048/data/data_source/interface/i_database_data_source.dart';
import 'package:game_2048/domain/entities/game_board_model.dart';
import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/domain/entities/tile.dart';

class GameBoardRepository implements IGameBoardRepository {
  final IDatabaseDataSource _databaseDataSource;

  GameBoardRepository(this._databaseDataSource);

  @override
  Future<GameBoardModel> getGameBoardState(GameBoardSettings gameBoardSettings) async =>
      _databaseDataSource.getGameBoardState(gameBoardSettings);

  @override
  Future<void> saveGameBoardState({
    required GameBoardSettings gameBoardSettings,
    int? record,
    int? score,
    List<List<Tile>>? gameBoard,
  }) async =>
      _databaseDataSource.saveGameBoardState(
        gameBoardSettings: gameBoardSettings,
        record: record,
        score: score,
        board: gameBoard,
      );
}
