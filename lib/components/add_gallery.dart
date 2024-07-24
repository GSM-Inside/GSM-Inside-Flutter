import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';

class AddGallery extends StatelessWidget {
  const AddGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed('make'),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 32,
        ),
        decoration: BoxDecoration(
          color: GIColorMain.main100_D5F0FB,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        height: 111,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/mdi-light_pencil.svg'),
                    const SizedBox(
                      width: 4,
                    ),
                    GIText(
                      text: '갤러리 만들기',
                      fontSize: GIFontSize.pretendard_600,
                      size: 16,
                      color: GIColorBlack.black,
                    )
                  ],
                ),
                GIText(
                  text: '새로운 갤러리를 만들어 보세요!',
                  fontSize: GIFontSize.pretendard_400,
                  size: 14,
                  color: GIColorBlack.grey500,
                )
              ],
            ),
            SvgPicture.asset('assets/images/plus.svg'),
          ],
        ),
      ),
    );
  }
}
