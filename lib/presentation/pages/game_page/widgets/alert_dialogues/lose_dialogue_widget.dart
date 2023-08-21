import 'package:flutter/material.dart';
import 'package:game_2048/presentation/pages/game_page/widgets/alert_dialogues/button_widget.dart';

class LoseDialogueWidget extends StatelessWidget {
  final VoidCallback startNewGame;
  final bool isNewRecord;
  final int score;

  const LoseDialogueWidget({
    super.key,
    required this.startNewGame,
    required this.isNewRecord,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Center(
        child: Text(
          'Game over!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'your score: $score',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isNewRecord)
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                'congratulations, it\'s a new record!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
        ],
      ),
      actions: <Widget>[
        AlertDialogueButtonWidget(text: 'menu', onPressed: () => _goToHomePage(context)),
        AlertDialogueButtonWidget(text: 'try again', onPressed: () => _tryAgain(context)),
      ],
    );
  }

  void _goToHomePage(BuildContext context) {
    Navigator.of(context).pop();
    startNewGame();
    Navigator.of(context).pop();
  }

  void _tryAgain(BuildContext context) {
    Navigator.of(context).pop();
    startNewGame();
  }
}
