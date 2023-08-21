import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/domain/entities/tile.dart';
import 'package:game_2048/presentation/pages/game_page/widgets/tile_box_widget.dart';

class AnimatedTileWidget extends AnimatedWidget {
  final Tile tile;
  final GameBoardSettings boardSettings;
  final double tilePadding;
  final Size boardSize;
  final Map<int, Color> tileColors;

  final _widthCoefficient = kIsWeb ? 0.8 : 0.9;

  const AnimatedTileWidget({
    required this.tile,
    required this.tilePadding,
    required this.boardSettings,
    required this.boardSize,
    required this.tileColors,
    required Animation<double> animation,
    Key? key,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final animationValue = animation.value;
    var containerWidth = (boardSize.height >= boardSize.width ? boardSize.width : boardSize.height - 100);
    final leftBoardIndent = (boardSize.width - containerWidth * _widthCoefficient) / 2;
    final width = (containerWidth * _widthCoefficient - (boardSettings.columnsCount + 1) * tilePadding) /
        boardSettings.columnsCount;
    final leftTileIndent =
        (leftBoardIndent + tile.column * width + tilePadding * (tile.column + 1)) + width / 2 * (1 - animationValue);
    final topTileIndent = tile.row * width + tilePadding * (tile.row + 1) + width / 2 * (1 - animationValue);
    return tile.value == 0
        ? Container()
        : TileBox(
            left: leftTileIndent,
            top: topTileIndent,
            size: width * animationValue,
            color: tileColors.containsKey(tile.value) ? tileColors[tile.value]! : Colors.orange[50]!,
            value: tile.value,
            fontSize: boardSettings.fontSize(tile.value),
          );
  }
}
