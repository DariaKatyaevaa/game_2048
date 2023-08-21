import 'dart:math' show Random;
import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/domain/entities/tile.dart';

final class GameBoard {
  final GameBoardSettings gameBoardSize;
  late int score;
  late List<List<Tile>> boardTiles;
  bool has2048 = false;

  GameBoard(
    this.gameBoardSize, {
    List<List<Tile>>? boardTiles,
    int? score,
  }) {
    this.boardTiles = boardTiles ??
        List.generate(
          gameBoardSize.rowsCount,
          (r) => List.generate(
            gameBoardSize.columnsCount,
            (c) => Tile(
              row: r,
              column: c,
              value: 0,
            ),
          ),
        );
    this.score = score ?? 0;
    if (boardTiles == null) initBoard();
  }

  factory GameBoard.copy(GameBoard board) {
    var tiles = board.boardTiles
        .map((l) => List<Tile>.from(
              l.map((t) => Tile.copy(t)),
            ))
        .toList();
    return GameBoard(
      board.gameBoardSize,
      boardTiles: tiles,
      score: board.score,
    );
  }

  void initBoard() {
    resetCanMerge();
    randomEmptyTile();
    randomEmptyTile();
  }

  void moveLeft() {
    if (!canMoveLeft()) {
      return;
    }

    for (int r = 0; r < gameBoardSize.rowsCount; ++r) {
      for (int c = 0; c < gameBoardSize.columnsCount; ++c) {
        mergeLeft(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  void moveRight() {
    if (!canMoveRight()) {
      return;
    }

    for (int r = 0; r < gameBoardSize.rowsCount; ++r) {
      for (int c = gameBoardSize.columnsCount - 2; c >= 0; --c) {
        mergeRight(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  void moveUp() {
    if (!canMoveUp()) {
      return;
    }

    for (int r = 0; r < gameBoardSize.rowsCount; ++r) {
      for (int c = 0; c < gameBoardSize.columnsCount; ++c) {
        mergeUp(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  void moveDown() {
    if (!canMoveDown()) {
      return;
    }

    for (int r = gameBoardSize.rowsCount - 2; r >= 0; --r) {
      for (int c = 0; c < gameBoardSize.columnsCount; ++c) {
        mergeDown(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  bool canMoveLeft() {
    for (int r = 0; r < gameBoardSize.rowsCount; ++r) {
      for (int c = 1; c < gameBoardSize.columnsCount; ++c) {
        if (canMerge(boardTiles[r][c], boardTiles[r][c - 1])) {
          return true;
        }
      }
    }
    return false;
  }

  bool canMoveRight() {
    for (int r = 0; r < gameBoardSize.rowsCount; ++r) {
      for (int c = gameBoardSize.columnsCount - 2; c >= 0; --c) {
        if (canMerge(boardTiles[r][c], boardTiles[r][c + 1])) {
          return true;
        }
      }
    }
    return false;
  }

  bool canMoveUp() {
    for (int r = 1; r < gameBoardSize.rowsCount; ++r) {
      for (int c = 0; c < gameBoardSize.columnsCount; ++c) {
        if (canMerge(boardTiles[r][c], boardTiles[r - 1][c])) {
          return true;
        }
      }
    }
    return false;
  }

  bool canMoveDown() {
    for (int r = gameBoardSize.rowsCount - 2; r >= 0; --r) {
      for (int c = 0; c < gameBoardSize.columnsCount; ++c) {
        if (canMerge(boardTiles[r][c], boardTiles[r + 1][c])) {
          return true;
        }
      }
    }
    return false;
  }

  void mergeLeft(int row, int col) {
    while (col > 0) {
      merge(boardTiles[row][col], boardTiles[row][col - 1]);
      col--;
    }
  }

  void mergeRight(int row, int col) {
    while (col < gameBoardSize.columnsCount - 1) {
      merge(boardTiles[row][col], boardTiles[row][col + 1]);
      col++;
    }
  }

  void mergeUp(int r, int col) {
    while (r > 0) {
      merge(boardTiles[r][col], boardTiles[r - 1][col]);
      r--;
    }
  }

  void mergeDown(int r, int col) {
    while (r < gameBoardSize.rowsCount - 1) {
      merge(boardTiles[r][col], boardTiles[r + 1][col]);
      r++;
    }
  }

  bool canMerge(Tile a, Tile b) {
    return !a.canMerge && ((b.isEmpty() && !a.isEmpty()) || (!a.isEmpty() && a == b));
  }

  void merge(Tile a, Tile b) {
    if (!canMerge(a, b)) {
      if (!a.isEmpty() && !b.canMerge) {
        b.canMerge = true;
      }
      return;
    }

    if (b.isEmpty()) {
      b.value = a.value;
      a.value = 0;
    } else if (a == b) {
      b.value = b.value * 2;
      if (!has2048 && b.value == 2048) {
        has2048 = true;
      }
      a.value = 0;
      score += b.value;
      b.canMerge = true;
    } else {
      b.canMerge = true;
    }
  }

  bool gameOver() {
    return !canMoveLeft() && !canMoveRight() && !canMoveUp() && !canMoveDown();
  }

  Tile getTile(int row, int column) {
    return boardTiles[row][column];
  }

  void randomEmptyTile() {
    List<Tile> empty = List<Tile>.empty(growable: true);

    for (var rows in boardTiles) {
      empty.addAll(rows.where((tile) => tile.isEmpty()));
    }

    if (empty.isEmpty) {
      return;
    }

    Random rng = Random();

    int index = rng.nextInt(empty.length);
    empty[index].value = rng.nextInt(9) == 0 ? 4 : 2;
    empty[index].isNew = true;
    empty.removeAt(index);
  }

  void resetCanMerge() {
    for (var rows in boardTiles) {
      for (var tile in rows) {
        tile.canMerge = false;
      }
    }
  }

  void resetIsNew() {
    for (var rows in boardTiles) {
      for (var tile in rows) {
        tile.isNew = true;
      }
    }
  }
}
