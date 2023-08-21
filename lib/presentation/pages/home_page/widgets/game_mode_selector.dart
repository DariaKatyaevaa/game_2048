import 'package:flutter/material.dart';

class GameModeSelector extends StatefulWidget {
  final String gameModeName;
  final VoidCallback? onLeftArrowTap;
  final VoidCallback? onRightArrowTap;

  const GameModeSelector({
    super.key,
    required this.gameModeName,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  });

  @override
  State<GameModeSelector> createState() => _GameModeSelectorState();
}

class _GameModeSelectorState extends State<GameModeSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: widget.onLeftArrowTap != null,
          replacement: const SizedBox(width: 26.0),
          child: GestureDetector(
            onTap: widget.onLeftArrowTap,
            child: const Icon(
              Icons.arrow_back_ios,
              size: 26.0,
              color: Colors.white70,
            ),
          ),
        ),
        SizedBox(
          width: 200,
          child: Center(
            child: Text(
              widget.gameModeName,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 26.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.onRightArrowTap != null,
          replacement: const SizedBox(width: 26.0),
          child: GestureDetector(
            onTap: widget.onRightArrowTap,
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 26.0,
              color: Colors.white70,
            ),
          ),
        )
      ],
    );
  }
}
