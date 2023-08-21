import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_2048/presentation/pages/about_page/about_page.dart';
import 'package:game_2048/presentation/theme/theme_provider.dart';
import 'package:game_2048/presentation/pages/home_page/widgets/game_mode_selector.dart';
import 'package:game_2048/presentation/pages/home_page/widgets/translucent_button.dart';
import 'package:game_2048/presentation/pages/game_page/game_page.dart';
import 'package:game_2048/presentation/pages/home_page/cubit/home_page_cubit.dart';
import 'package:game_2048/presentation/pages/home_page/cubit/home_page_state.dart';
import 'package:game_2048/presentation/di/injector.dart';

class HomePage extends StatelessWidget {
  final HomePageCubit _cubit = i.get<HomePageCubit>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
        bloc: _cubit,
        builder: (context, state) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ThemeProvider.of(context).theme.startGradientColor,
                    ThemeProvider.of(context).theme.stopGradientColor,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '2048',
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  GameModeSelector(
                    gameModeName: state.boardSize.name,
                    onLeftArrowTap: state.showLeftArrow ? _cubit.decreaseGameBoardSize : null,
                    onRightArrowTap: state.showRightArrow ? _cubit.increaseGameBoardSize : null,
                  ),
                  const SizedBox(height: 32.0),
                  TranslucentButton(
                    text: 'PLAY',
                    onTap: () => _goToGamePage(context, state),
                  ),
                  const SizedBox(height: 16.0),
                  TranslucentButton(
                    text: 'THEME',
                    onTap: _cubit.changeTheme,
                  ),
                  const SizedBox(height: 16.0),
                  TranslucentButton(
                    text: 'ABOUT',
                    onTap: () => _goToAboutPage(context),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _goToGamePage(
    BuildContext context,
    HomePageState state,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GamePage(
          gameBoardSize: _cubit.state.boardSize,
        ),
      ),
    );
  }

  void _goToAboutPage(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const AboutPage(),
        ),
      );
}
