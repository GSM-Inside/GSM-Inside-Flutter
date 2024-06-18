import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/components/board_preview.dart';
import 'package:gsm_inside_flutter/components/gallery_preview.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_image.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/images/logo_small.svg',
                      width: 36,
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GIImageButton(
                              onPressed: () {},
                              assetName: 'assets/images/mdi-light_pencil.svg'),
                          const SizedBox(width: 18),
                          GIImageButton(
                              onPressed: () {},
                              assetName: 'assets/images/mdi-light_lignt.svg'),
                          const SizedBox(width: 18),
                          GIImageButton(
                              onPressed: () {},
                              assetName: 'assets/images/mdi-light_magnify.svg')
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 78),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GIText(
                      text: '인기 게시판',
                      fontSize: GIFontSize.pretendard_600,
                      size: 20,
                      color: GIColorBlack.black,
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Row(
                        children: [
                          GIText(
                            text: '더보기',
                            fontSize: GIFontSize.pretendard_300,
                            size: 12,
                            color: GIColorBlack.black,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 12,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const BoardPreview(),
                const SizedBox(
                  height: 12,
                ),
                const BoardPreview(),
                const SizedBox(
                  height: 65,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GIText(
                      text: '인기 갤러리',
                      fontSize: GIFontSize.pretendard_600,
                      size: 20,
                      color: GIColorBlack.black,
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Row(
                        children: [
                          GIText(
                            text: '더보기',
                            fontSize: GIFontSize.pretendard_300,
                            size: 12,
                            color: GIColorBlack.black,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 12,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(
                      width: 1,
                      color: GIColorBlack.grey200,
                    ),
                  ),
                  child: const Column(
                    children: [
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                      GalleryPreview(title: "무슨무슨 갤러리", hot: true),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
