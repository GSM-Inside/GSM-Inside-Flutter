import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GIImageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String assetName;
  const GIImageButton({
    super.key,
    required this.onPressed,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(),
        height: 24,
        width: 24,
        child: SvgPicture.asset(
          assetName,
        ),
      ),
    );
  }
}
