import 'package:hive/hive.dart';

part 'theme_type.g.dart';

@HiveType(typeId: 0)
enum ThemeTypeDb {
  @HiveField(0)
  green,
  @HiveField(1)
  blue,
  @HiveField(2)
  purple,
}
