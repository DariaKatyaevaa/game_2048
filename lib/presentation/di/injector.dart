import 'package:game_2048/presentation/di/cubit_module.dart';
import 'package:game_2048/presentation/di/interactor_module.dart';
import 'package:game_2048/presentation/di/repository_module.dart';
import 'package:game_2048/presentation/di/data_source_module.dart';
import 'package:get_it/get_it.dart';

GetIt get i => GetIt.instance;

void initInjector() {
  initDataSourceModule();
  initRepositoryModule();
  initInteractorModule();
  initCubitModule();
}
