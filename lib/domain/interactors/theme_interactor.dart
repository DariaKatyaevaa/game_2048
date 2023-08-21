import 'package:game_2048/domain/data_interfaces/i_theme_repository.dart';
import 'package:game_2048/domain/entities/theme_type.dart';

class ThemeInteractor {
  final IThemeRepository _settingsRepository;

  ThemeInteractor(this._settingsRepository);

  void saveTheme(ThemeType themeType) {
    _settingsRepository.saveThemeType(themeType);
  }

  Future<ThemeType> getCurrentTheme() {
    return _settingsRepository.getThemeType();
  }
}
