import 'package:flutter/material.dart';

class GameBoardIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const GameBoardIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Center(
            child: Icon(
          icon,
          size: 32.0,
          color: Colors.white70,
        )),
      ),
    );
  }
}
