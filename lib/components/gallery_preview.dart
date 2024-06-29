import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';

class GalleryPreview extends StatelessWidget {
  final String title;
  final int hot;
  const GalleryPreview({
    super.key,
    required this.title,
    required this.hot,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: const BoxDecoration(),
              child: Row(
                children: [
                  Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  GIText(
                    text: title,
                    fontSize: GIFontSize.pretendard_400,
                    size: 14,
                    color: GIColorBlack.black,
                  ),
                ],
              ),
            ),
            ranking(hot),
          ],
        ),
      ),
    );
  }
}

ranking(int hot) {
  Color color = GIColorMain.main100_D5F0FB;
  switch (hot) {
    case 1:
      color = GIColorMain.main600_05A4E9;
    case 2:
      color = GIColorMain.main500_2FB3ED;
    case 3:
      color = GIColorMain.main400_58C2F0;
    case 4:
      color = GIColorMain.main300_82D2F4;
    case 5:
      color = GIColorMain.main200_ACE1F8;
  }
  return Container(
    decoration: const BoxDecoration(),
    child: Row(
      children: [
        GIText(
          text: '$hot등',
          fontSize: GIFontSize.pretendard_300,
          size: 12,
          color: color,
        ),
        const SizedBox(
          width: 5,
        ),
        SvgPicture.asset('assets/images/hot.svg'),
      ],
    ),
  );
}
