import 'package:game_2048/data/entities/hive/theme_type.dart';
import 'package:game_2048/domain/entities/theme_type.dart';

extension ThemeTypeMapperTo on ThemeType {
  ThemeTypeDb toHive() => switch (this) {
        ThemeType.green => ThemeTypeDb.green,
        ThemeType.blue => ThemeTypeDb.blue,
        ThemeType.purple => ThemeTypeDb.purple
      };
}

extension ThemeTypeMapperFrom on ThemeTypeDb {
  ThemeType fromHive() => switch (this) {
        ThemeTypeDb.green => ThemeType.green,
        ThemeTypeDb.blue => ThemeType.blue,
        ThemeTypeDb.purple => ThemeType.purple
      };
}
