import 'package:hive/hive.dart';

part 'game_board_settings.g.dart';

@HiveType(typeId: 1)
enum GameBoardSettingsDb {
  @HiveField(0)
  tiny,
  @HiveField(1)
  classic,
  @HiveField(2)
  big,
  @HiveField(3)
  bigger,
  @HiveField(4)
  huge,
  @HiveField(5)
  hugger,
}
