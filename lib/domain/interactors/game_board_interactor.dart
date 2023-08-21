import 'package:game_2048/domain/data_interfaces/i_game_board_repository.dart';
import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/domain/entities/game_board_model.dart';
import 'package:game_2048/domain/entities/tile.dart';

class GameBoardInteractor {
  final IGameBoardRepository _gameBoardRepository;

  GameBoardInteractor(this._gameBoardRepository);

  Future<GameBoardModel> getCurrentGameBoard(GameBoardSettings gameBoardSettings) =>
      _gameBoardRepository.getGameBoardState(gameBoardSettings);

  void saveCurrentGameBoard({
    required GameBoardSettings gameBoardSettings,
    List<List<Tile>>? gameBoard,
    int? record,
    int? score,
  }) =>
      _gameBoardRepository.saveGameBoardState(
        gameBoardSettings: gameBoardSettings,
        gameBoard: gameBoard,
        score: score,
        record: record,
      );
}
