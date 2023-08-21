import 'package:game_2048/domain/entities/game_board_model.dart';
import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/domain/entities/tile.dart';

abstract class IGameBoardRepository {
  Future<GameBoardModel> getGameBoardState(GameBoardSettings gameBoardSettings);

  Future<void> saveGameBoardState({
    required GameBoardSettings gameBoardSettings,
    int? record,
    int? score,
    List<List<Tile>>? gameBoard,
  });
}
