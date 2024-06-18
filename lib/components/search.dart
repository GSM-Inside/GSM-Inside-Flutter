import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';

class Search extends StatelessWidget {
  final String searchWord;
  const Search({
    super.key,
    required this.searchWord,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Container(
            decoration: const BoxDecoration(),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/circle.svg'),
                const SizedBox(
                  width: 25,
                ),
                GIText(
                  text: searchWord,
                  fontSize: GIFontSize.pretendard_300,
                  size: 14,
                  color: GIColorBlack.black,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          child: SvgPicture.asset('assets/images/delete.svg'),
        )
      ],
    );
  }
}
