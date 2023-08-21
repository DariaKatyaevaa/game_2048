import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game_2048/domain/entities/theme_type.dart';
import 'package:game_2048/domain/interactors/theme_interactor.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeInteractor _themeInteractor;

  ThemeCubit(this._themeInteractor) : super(ThemeState()) {
    _init();
  }

  void _init() async {
    var currentTheme = await _themeInteractor.getCurrentTheme();
    emit(ThemeState(themeType: currentTheme));
  }

  void changeTheme() {
    var themeType = switch (state.themeType) {
      ThemeType.green => ThemeType.blue,
      ThemeType.purple => ThemeType.green,
      ThemeType.blue => ThemeType.purple,
    };
    _themeInteractor.saveTheme(themeType);
    emit(ThemeState(themeType: themeType));
  }
}
