import 'package:flutter/material.dart';
import 'package:game_2048/domain/entities/theme_type.dart';

class ThemeProvider extends InheritedWidget {
  final ThemeType theme;

  const ThemeProvider({
    Key? key,
    required Widget child,
    required this.theme,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) => theme != oldWidget.theme;

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }
}
