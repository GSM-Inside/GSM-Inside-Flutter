import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';

class BoardPreview extends StatelessWidget {
  final String galleryTitle;
  final String date;
  final String title;
  final String content;
  final int like;
  final int comment;
  const BoardPreview({
    super.key,
    required this.galleryTitle,
    required this.date,
    required this.title,
    required this.content,
    required this.like,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 4),
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
                      text: galleryTitle,
                      fontSize: GIFontSize.pretendard_300,
                      size: 12,
                      color: GIColorBlack.black,
                    )
                  ],
                ),
              ),
              GIText(
                text: date,
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
            text: title,
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
              text: content,
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
                text: '$like',
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
                text: '$comment',
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
