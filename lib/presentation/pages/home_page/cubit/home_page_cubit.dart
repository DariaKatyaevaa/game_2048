import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_2048/domain/entities/game_board_settings.dart';
import 'package:game_2048/presentation/pages/home_page/cubit/home_page_state.dart';
import 'package:game_2048/presentation/theme/theme_cubit.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final ThemeCubit _appCubit;

  HomePageCubit(this._appCubit)
      : super(HomePageState(
          boardSize: GameBoardSettings.classic,
          showLeftArrow: true,
          showRightArrow: true,
        ));

  void increaseGameBoardSize() {
    final index = GameBoardSettings.values.indexOf(state.boardSize) + 1;
    if (index <= GameBoardSettings.values.length - 1) {
      emit(state.copyWith(
        boardSize: GameBoardSettings.values.elementAt(index),
        showLeftArrow: true,
        showRightArrow: index != GameBoardSettings.values.length - 1,
      ));
    }
  }

  void decreaseGameBoardSize() {
    final index = GameBoardSettings.values.indexOf(state.boardSize) - 1;
    if (index >= 0) {
      emit(state.copyWith(
        boardSize: GameBoardSettings.values.elementAt(index),
        showLeftArrow: index != 0,
        showRightArrow: true,
      ));
    }
  }

  void changeTheme() => _appCubit.changeTheme();
}
