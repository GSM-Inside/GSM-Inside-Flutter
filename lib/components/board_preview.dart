import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';

class BoardPreview extends StatelessWidget {
  const BoardPreview({super.key});

  final String _galleryTitle = '아무말 갤러리';
  final String _date = '1시간 전';
  final String _title = '제목';
  final String _content =
      '이렇쿵저렁쿵이렇쿵저렁쿵 이러이러 해서 이렁쿵 저렁쿵 이러해서 이러해서 그렇게 되었다고 하는데 나느 잘 모르겠어 ㅎㅎ';
  final int _like = 100;
  final int _comment = 200;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: GIColorBlack.grey200,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Row(
                  children: [
                    Container(
                      height: 18,
                      width: 18,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GIText(
                      text: _galleryTitle,
                      fontSize: GIFontSize.pretendard_300,
                      size: 12,
                      color: GIColorBlack.black,
                    )
                  ],
                ),
              ),
              GIText(
                text: _date,
                fontSize: GIFontSize.pretendard_300,
                size: 14,
                color: GIColorBlack.grey600,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GIText(
            text: _title,
            fontSize: GIFontSize.pretendard_600,
            size: 16,
            color: GIColorBlack.black,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: const BoxDecoration(),
            width: 170,
            child: GIText(
              text: _content,
              fontSize: GIFontSize.pretendard_300,
              size: 12,
              color: GIColorBlack.grey600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/images/like_logo.svg'),
              const SizedBox(
                width: 6,
              ),
              GIText(
                text: '$_like',
                fontSize: GIFontSize.pretendard_300,
                size: 10,
                color: GIColorMain.main600_05A4E9,
              ),
              const SizedBox(
                width: 14,
              ),
              SvgPicture.asset('assets/images/comment_logo.svg'),
              const SizedBox(
                width: 6,
              ),
              GIText(
                text: '$_comment',
                fontSize: GIFontSize.pretendard_300,
                size: 10,
                color: GIColorMain.main600_05A4E9,
              ),
            ],
          )
        ],
      ),
    );
  }
}
