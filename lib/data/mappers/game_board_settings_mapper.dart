import 'package:game_2048/data/entities/hive/game_board_settings.dart';
import 'package:game_2048/domain/entities/game_board_settings.dart';

extension GameBoardMapperTo on GameBoardSettings {
  GameBoardSettingsDb toHive() => switch (this) {
        GameBoardSettings.tiny => GameBoardSettingsDb.tiny,
        GameBoardSettings.classic => GameBoardSettingsDb.classic,
        GameBoardSettings.big => GameBoardSettingsDb.big,
        GameBoardSettings.bigger => GameBoardSettingsDb.bigger,
        GameBoardSettings.huge => GameBoardSettingsDb.huge,
        GameBoardSettings.huger => GameBoardSettingsDb.hugger,
      };
}

extension GameBoardMapperFrom on GameBoardSettingsDb {
  GameBoardSettings fromHive() => switch (this) {
        GameBoardSettingsDb.tiny => GameBoardSettings.tiny,
        GameBoardSettingsDb.classic => GameBoardSettings.classic,
        GameBoardSettingsDb.big => GameBoardSettings.big,
        GameBoardSettingsDb.bigger => GameBoardSettings.bigger,
        GameBoardSettingsDb.huge => GameBoardSettings.huge,
        GameBoardSettingsDb.hugger => GameBoardSettings.huger,
      };
}
