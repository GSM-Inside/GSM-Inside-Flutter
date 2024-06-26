import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gsm_inside_flutter/apis/fetchBoard.dart';
import 'package:gsm_inside_flutter/components/add_gallery.dart';
import 'package:gsm_inside_flutter/components/board_preview.dart';
import 'package:gsm_inside_flutter/components/gallery_preview.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_image.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> data = [];
  void fetchPosts() async {
    data.add(FetchBoardApi().getApiFetch());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

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
                      width: 108,
                      height: 36,
                    ),
                    GIImageButton(
                        onPressed: () {
                          context.go('/search');
                        },
                        assetName: 'assets/images/mdi-light_magnify.svg'),
                  ],
                ),
                const SizedBox(height: 78),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 39,
                ),
                const AddGallery(),
                const SizedBox(
                  height: 50,
                ),
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => const BoardPreview(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
