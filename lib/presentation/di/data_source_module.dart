import 'package:game_2048/data/data_source/database_data_source.dart';
import 'package:game_2048/data/data_source/interface/i_database_data_source.dart';

import 'injector.dart';

void initDataSourceModule() {
  i.registerSingleton<IDatabaseDataSource>(DatabaseDataSource());
}
