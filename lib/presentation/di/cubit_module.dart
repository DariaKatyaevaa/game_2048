import 'package:game_2048/presentation/pages/game_page/cubit/game_page_cubit.dart';
import 'package:game_2048/presentation/theme/theme_cubit.dart';
import 'package:game_2048/presentation/pages/home_page/cubit/home_page_cubit.dart';
import 'package:game_2048/presentation/di/injector.dart';

void initCubitModule() {
  i.registerSingleton(ThemeCubit(i.get()));
  i.registerSingleton(HomePageCubit(i.get()));
  i.registerFactory(() => GamePageCubit(i.get()));
}
