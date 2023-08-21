import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_2048/presentation/theme/theme_cubit.dart';
import 'package:game_2048/presentation/theme/theme_state.dart';
import 'package:game_2048/presentation/theme/theme_provider.dart';
import 'package:game_2048/presentation/di/injector.dart';
import 'package:game_2048/presentation/pages/splash_page/splash_page.dart';
import 'package:game_2048/data/data_source/database_data_source.dart';

void main() async {
  await DatabaseDataSource.initializeHive();
  initInjector();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeCubit _cubit = i.get<ThemeCubit>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      bloc: _cubit,
      builder: (context, state) {
        return ThemeProvider(
          theme: state.themeType,
          child: MaterialApp(
            title: '2048',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Roboto',
            ),
            home: const SplashPage(),
          ),
        );
      },
    );
  }
}
