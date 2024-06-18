import 'package:flutter/material.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';

class AddGallery extends StatelessWidget {
  const AddGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GIColorMain.main100_D5F0FB,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      height: 112,
    );
  }
}
