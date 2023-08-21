import 'dart:ui';
import 'package:game_2048/presentation/util/tile_colors.dart';

enum ThemeType {
  green(
    startGradientColor: Color(0xffadff7f),
    stopGradientColor: Color(0xff1e4eef),
    tileColors: greenTileColors,
  ),
  blue(
    startGradientColor: Color(0xffe2b7f6),
    stopGradientColor: Color(0xff0045e8),
    tileColors: blueTileColors,
  ),
  purple(
    startGradientColor: Color(0xffffb378),
    stopGradientColor: Color(0xff5e00cc),
    tileColors: purpleTileColors,
  );

  const ThemeType({
    required this.startGradientColor,
    required this.stopGradientColor,
    required this.tileColors,
  });

  final Color startGradientColor;
  final Color stopGradientColor;
  final Map<int, Color> tileColors;
}
