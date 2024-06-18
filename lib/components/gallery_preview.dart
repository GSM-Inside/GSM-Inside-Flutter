import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';

class GalleryPreview extends StatelessWidget {
  final String title;
  final bool hot;
  const GalleryPreview({
    super.key,
    required this.title,
    required this.hot,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("hello world"),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
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
            hot
                ? Container(
                    decoration: const BoxDecoration(),
                    child: Row(
                      children: [
                        GIText(
                          text: '인기 급상승',
                          fontSize: GIFontSize.pretendard_300,
                          size: 12,
                          color: GIColorMain.main600_05A4E9,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset('assets/images/hot.svg'),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
