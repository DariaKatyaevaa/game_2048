import 'package:game_2048/domain/interactors/game_board_interactor.dart';
import 'package:game_2048/domain/interactors/theme_interactor.dart';

import 'injector.dart';

void initInteractorModule() {
  i.registerFactory(() => ThemeInteractor(i.get()));
  i.registerFactory(() => GameBoardInteractor(i.get()));
}
