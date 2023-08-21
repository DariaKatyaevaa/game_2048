import 'package:game_2048/data/repository/game_board_repository.dart';
import 'package:game_2048/domain/data_interfaces/i_game_board_repository.dart';
import 'package:game_2048/data/repository/theme_repository.dart';
import 'package:game_2048/domain/data_interfaces/i_theme_repository.dart';
import 'package:game_2048/presentation/di/injector.dart';

void initRepositoryModule() {
  i.registerSingleton<IThemeRepository>(ThemeRepository(i.get()));
  i.registerSingleton<IGameBoardRepository>(GameBoardRepository(i.get()));
}
