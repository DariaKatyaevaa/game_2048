import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_2048/presentation/theme/theme_provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white70,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 200 : 40.0),
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
        child: const Center(
          child: Text(
            kIsWeb
                ? 'HOW TO PLAY:\nUse your arrow keys to move the tiles.\n'
                    ' Tiles with the same number merge into one when they touch.\n'
                    ' Add them up to reach 2048!'
                : 'Join the numbers and get to the 2048 tile!\n'
                    'Swipe to move all tiles.\n'
                    'When two tiles with the same number touch, '
                    'they merge into one. Get to the 2048 tile,'
                    ' and reach high score!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
