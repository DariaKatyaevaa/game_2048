import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/domain/entities/theme_type.dart';

class HomePageState {
  final GameBoardSettings boardSize;
  final bool showLeftArrow;
  final bool showRightArrow;

  HomePageState({
    required this.boardSize,
    required this.showLeftArrow,
    required this.showRightArrow,
  });

  HomePageState copyWith({
    ThemeType? theme,
    GameBoardSettings? boardSize,
    bool? showLeftArrow,
    bool? showRightArrow,
  }) =>
      HomePageState(
        boardSize: boardSize ?? this.boardSize,
        showLeftArrow: showLeftArrow ?? this.showLeftArrow,
        showRightArrow: showRightArrow ?? this.showRightArrow,
      );
}
