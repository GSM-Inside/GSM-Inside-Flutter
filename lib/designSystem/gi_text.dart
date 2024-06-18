import 'package:flutter/material.dart';

class GITextBlack extends StatelessWidget {
  final String text;
  final String fontSize;
  final double size;

  const GITextBlack({
    super.key,
    required this.text,
    required this.fontSize,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontSize,
        fontSize: size,
      ),
    );
  }
}
