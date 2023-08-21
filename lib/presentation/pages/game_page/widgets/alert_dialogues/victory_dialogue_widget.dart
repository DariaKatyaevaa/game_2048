import 'package:flutter/material.dart';
import 'package:game_2048/presentation/pages/game_page/widgets/alert_dialogues/button_widget.dart';

class VictoryDialogueWidget extends StatelessWidget {
  const VictoryDialogueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Center(
        child: Text(
          'Congratulations!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
      ),
      content: const Text(
        'You got 2048!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        AlertDialogueButtonWidget(
          text: 'continue',
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
