import 'package:game_2048/domain/entities/theme_type.dart';

abstract class IThemeRepository {
  Future<ThemeType> getThemeType();

  void saveThemeType(ThemeType themeType);
}
