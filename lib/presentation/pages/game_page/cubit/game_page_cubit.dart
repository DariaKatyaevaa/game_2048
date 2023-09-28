import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_2048/domain/entities/game_board.dart';
import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/presentation/pages/game_page/cubit/game_page_state.dart';
import 'package:game_2048/domain/interactors/game_board_interactor.dart';

class GamePageCubit extends Cubit<GamePageState> {
  final GameBoardInteractor _gameBoardInteractor;

  GamePageCubit(this._gameBoardInteractor)
      : super(
          GamePageState(
            gameBoard: GameBoard(GameBoardSettings.classic),
            isGameOver: false,
          ),
        );

  void init(GameBoardSettings gameBoardSettings) async {
    var gameBoardModel = await _gameBoardInteractor.getCurrentGameBoard(gameBoardSettings);
    emit(
      GamePageState(
        gameBoard: GameBoard(
          gameBoardSettings,
          boardTiles: gameBoardModel.toTile(),
          score: gameBoardModel.score,
        ),
        record: gameBoardModel.record,
      ),
    );
  }

  void newGame() {
    dispose();
    init(state.gameBoard.gameBoardSize);
  }

  void cancelMove() {
    if (state.previousGameBoard != null) {
      emit(
        state.copyWith(
          gameBoard: GameBoard.copy(state.previousGameBoard!)..resetIsNew(),
          previousGameBoard: null,
        ),
      );
    }
  }

  void _gameOver() {
    if (state.gameBoard.gameOver()) {
      _gameBoardInteractor.saveCurrentGameBoard(
        gameBoardSettings: state.gameBoard.gameBoardSize,
        record: max(state.record, state.gameBoard.score),
        score: 0,
      );
      emit(state.copyWith(
        isGameOver: true,
        isNewRecord: state.gameBoard.score > state.record,
      ));
    }
  }

  void _isVictory() {
    if (state.gameBoard.has2048) {
      emit(state.copyWith(isVictory: true));
    }
  }

  void move(MovesType move) {
    var previousGameBoard = GameBoard.copy(state.gameBoard);
    var gameBoard = switch (move) {
      MovesType.left => state.gameBoard..moveLeft(),
      MovesType.right => state.gameBoard..moveRight(),
      MovesType.up => state.gameBoard..moveUp(),
      MovesType.down => state.gameBoard..moveDown(),
    };
    emit(state.copyWith(
      previousGameBoard: previousGameBoard,
      gameBoard: gameBoard,
    ));
    _gameOver();
    _isVictory();
  }

  void setContinue() {
    emit(state.copyWith(isContinue: true));
  }

  void dispose() async {
    _gameBoardInteractor.saveCurrentGameBoard(
      gameBoardSettings: state.gameBoard.gameBoardSize,
      gameBoard: state.isGameOver ? null : state.gameBoard.boardTiles,
      record: max(state.gameBoard.score, state.record),
      score: state.isGameOver ? null : state.gameBoard.score,
    );
  }
}

enum MovesType {
  left,
  right,
  up,
  down,
}
