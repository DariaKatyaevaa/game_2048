import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_2048/presentation/pages/game_page/widgets/game_board_icon_button.dart';
import 'package:game_2048/presentation/pages/game_page/widgets/alert_dialogues/lose_dialogue_widget.dart';
import 'package:game_2048/presentation/pages/game_page/widgets/score_widget.dart';
import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/presentation/pages/game_page/cubit/game_page_cubit.dart';
import 'package:game_2048/presentation/pages/game_page/cubit/game_page_state.dart';
import 'package:game_2048/presentation/pages/game_page/widgets/game_board_widget.dart';
import 'package:game_2048/presentation/pages/game_page/widgets/tile_widget.dart';
import 'package:game_2048/presentation/pages/game_page/widgets/alert_dialogues/victory_dialogue_widget.dart';
import 'package:game_2048/presentation/theme/theme_provider.dart';
import 'package:game_2048/presentation/di/injector.dart';

class GamePage extends StatefulWidget {
  final GameBoardSettings gameBoardSize;

  const GamePage({
    required this.gameBoardSize,
    super.key,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final GamePageCubit _cubit = i.get<GamePageCubit>();
  bool _isMoving = false;
  final FocusNode _focusNode = FocusNode();
  final double tilePadding = 5.0;

  @override
  void initState() {
    super.initState();
    _cubit.init(widget.gameBoardSize);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GamePageCubit, GamePageState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state.isGameOver) {
            _showLooseDialogue(context);
          } else if (state.isVictory) {
            _showVictoryDialogue(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: RawKeyboardListener(
              autofocus: true,
              focusNode: _focusNode,
              onKey: _handleKeyboardEvent,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ThemeProvider.of(context).theme.startGradientColor,
                      ThemeProvider.of(context).theme.stopGradientColor,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            '2048',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              ScoreWidget(
                                text: 'score',
                                score: state.gameBoard.score,
                              ),
                              const SizedBox(width: 8.0),
                              ScoreWidget(
                                text: 'best',
                                score: max(state.gameBoard.score, state.record),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GameBoardIconButton(
                          icon: Icons.home_rounded,
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(width: 16.0),
                        GameBoardIconButton(
                          icon: Icons.replay_rounded,
                          onTap: _cubit.cancelMove,
                        ),
                        const SizedBox(width: 16.0),
                        GameBoardIconButton(
                          icon: Icons.sync_rounded,
                          onTap: _cubit.newGame,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      onVerticalDragUpdate: (detail) {
                        if (detail.delta.distance == 0 || _isMoving) {
                          return;
                        }
                        _isMoving = true;
                        _cubit.move(detail.delta.direction > 0 ? MovesType.down : MovesType.up);
                      },
                      onVerticalDragEnd: (_) => _isMoving = false,
                      onVerticalDragCancel: () => _isMoving = false,
                      onHorizontalDragUpdate: (detail) {
                        if (detail.delta.distance == 0 || _isMoving) {
                          return;
                        }
                        _isMoving = true;
                        _cubit.move(detail.delta.direction > 0 ? MovesType.left : MovesType.right);
                      },
                      onHorizontalDragEnd: (_) => _isMoving = false,
                      onHorizontalDragCancel: () => _isMoving = false,
                      child: Stack(
                        children: [
                          Center(
                            child: GameBoardWidget(
                              boardSettings: state.gameBoard.gameBoardSize,
                              tilePadding: tilePadding,
                              boardSize: MediaQuery.of(context).size,
                            ),
                          ),
                          ..._tileWidgetsList(context, state),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  List<Widget> _tileWidgetsList(BuildContext context, GamePageState state) {
    var tileWidgets = List<TileWidget>.empty(growable: true);
    for (int r = 0; r < state.gameBoard.gameBoardSize.rowsCount; ++r) {
      for (int c = 0; c < state.gameBoard.gameBoardSize.columnsCount; ++c) {
        tileWidgets.add(
          TileWidget(
            tile: state.gameBoard.getTile(r, c),
            gameBoardSize: state.gameBoard.gameBoardSize,
            tilePadding: tilePadding,
            boardSize: MediaQuery.of(context).size,
            tileColors: ThemeProvider.of(context).theme.tileColors,
          ),
        );
      }
    }
    return tileWidgets;
  }

  void _handleKeyboardEvent(RawKeyEvent key) {
    if (key.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
      _cubit.move(MovesType.down);
    } else if (key.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
      _cubit.move(MovesType.up);
    } else if (key.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
      _cubit.move(MovesType.left);
    } else if (key.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
      _cubit.move(MovesType.right);
    }
  }

  void _showLooseDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => LoseDialogueWidget(
        startNewGame: _cubit.newGame,
        isNewRecord: _cubit.state.isNewRecord,
        score: _cubit.state.gameBoard.score,
      ),
    );
  }

  void _showVictoryDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const VictoryDialogueWidget(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.dispose();
    _focusNode.dispose();
  }
}
