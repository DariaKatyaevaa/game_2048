import 'package:flutter/material.dart';
import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/domain/entities/tile.dart';
import 'package:game_2048/presentation/pages/game_page/widgets/animated_tile_widget.dart';

class TileWidget extends StatefulWidget {
  final Tile tile;
  final GameBoardSettings gameBoardSize;
  final double tilePadding;
  final Size boardSize;
  final Map<int, Color> tileColors;

  const TileWidget({
    required this.tile,
    required this.tilePadding,
    required this.gameBoardSize,
    required this.boardSize,
    required this.tileColors,
    Key? key,
  }) : super(key: key);

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    widget.tile.isNew = false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tile.isNew && !widget.tile.isEmpty()) {
      controller.reset();
      controller.forward();
      widget.tile.isNew = false;
    } else {
      controller.animateTo(1.0);
    }

    return AnimatedTileWidget(
      tile: widget.tile,
      animation: animation,
      boardSettings: widget.gameBoardSize,
      tilePadding: widget.tilePadding,
      boardSize: widget.boardSize,
      tileColors: widget.tileColors,
    );
  }
}
