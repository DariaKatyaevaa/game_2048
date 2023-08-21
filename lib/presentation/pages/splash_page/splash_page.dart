import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:game_2048/presentation/pages/home_page/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => _goToHomePage(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText(
              '2048',
              textStyle: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              duration: const Duration(milliseconds: 3000),
            )
          ],
        ),
      ),
    );
  }

  void _goToHomePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
