import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/presentation/pages/game_page/widgets/tile_box_widget.dart';

class GameBoardWidget extends StatelessWidget {
  final double tilePadding;
  final Size boardSize;
  final GameBoardSettings boardSettings;

  final _widthCoefficient = kIsWeb ? 0.8 : 0.9;

  const GameBoardWidget({
    super.key,
    required this.tilePadding,
    required this.boardSize,
    required this.boardSettings,
  });

  @override
  Widget build(BuildContext context) {
    var containerWidth =
        (boardSize.height >= boardSize.width ? boardSize.width : boardSize.height - 100) * _widthCoefficient;
    var width = (containerWidth - (boardSettings.columnsCount + 1) * tilePadding) / boardSettings.columnsCount;
    var backgroundBox = List<TileBox>.empty(growable: true);
    for (int r = 0; r < boardSettings.rowsCount; ++r) {
      for (int c = 0; c < boardSettings.columnsCount; ++c) {
        TileBox tile = TileBox(
          left: c * width + tilePadding * (c + 1),
          top: r * width + tilePadding * (r + 1),
          size: width,
        );
        backgroundBox.add(tile);
      }
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: boardSize.width * 0.05),
      width: containerWidth,
      height: containerWidth,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: backgroundBox,
      ),
    );
  }
}
