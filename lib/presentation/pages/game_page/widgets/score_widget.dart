import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final String text;
  final int score;

  const ScoreWidget({
    Key? key,
    required this.text,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kIsWeb ? 100.0 : MediaQuery.of(context).size.width * 0.22,
      padding: const EdgeInsets.symmetric(vertical: 8.0), //, horizontal: 16.0),
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              score.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
