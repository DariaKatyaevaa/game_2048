import 'package:flutter/material.dart';
import 'package:game_2048/presentation/theme/theme_provider.dart';

class AlertDialogueButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AlertDialogueButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.black87,
          gradient: LinearGradient(
            colors: [
              ThemeProvider.of(context).theme.startGradientColor,
              ThemeProvider.of(context).theme.stopGradientColor,
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
