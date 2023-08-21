import 'package:flutter/material.dart';

class TileBox extends StatelessWidget {
  final double left;
  final double top;
  final double size;
  final Color? color;
  final int? value;
  final double? fontSize;

  const TileBox({
    required this.left,
    required this.top,
    required this.size,
    this.fontSize,
    this.color,
    this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color ?? Colors.white10,
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Center(
          child: Text(
            value == null ? '' : value.toString(),
            style: TextStyle(
              color: value != null && value! >= 8 ? Colors.white : Colors.black54,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: '',
            ),
          ),
        ),
      ),
    );
  }
}
