import 'package:flutter/material.dart';

class GIText extends StatelessWidget {
  final String text;
  final String fontSize;
  final double size;
  final Color color;

  const GIText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.size,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
        fontFamily: fontSize,
        fontSize: size,
        color: color,
      ),
    );
  }
}
