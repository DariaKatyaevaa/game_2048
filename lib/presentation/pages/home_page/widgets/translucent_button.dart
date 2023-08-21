import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TranslucentButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const TranslucentButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: kIsWeb ? 300.0 : null,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
