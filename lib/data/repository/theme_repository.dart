import 'package:game_2048/data/data_source/interface/i_database_data_source.dart';
import 'package:game_2048/domain/data_interfaces/i_theme_repository.dart';
import 'package:game_2048/domain/entities/theme_type.dart';

class ThemeRepository implements IThemeRepository {
  final IDatabaseDataSource _databaseDataSource;

  ThemeRepository(this._databaseDataSource);

  @override
  Future<ThemeType> getThemeType() async => _databaseDataSource.getThemeType();

  @override
  void saveThemeType(ThemeType themeType) async => _databaseDataSource.saveThemeType(themeType);
}
