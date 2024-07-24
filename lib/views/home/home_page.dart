import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gsm_inside_flutter/components/add_gallery.dart';
import 'package:gsm_inside_flutter/components/gallery_preview.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_image.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';
import 'package:gsm_inside_flutter/models/board_api_model.dart';
import 'package:gsm_inside_flutter/models/gallery_api_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<BoardGetApi> posts = [];
  List<GalleryGetApiModel> gallerys = [];
  List<GalleryGetApiModel> postsDetail = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/images/logo_small.svg',
              width: 108,
              height: 36,
            ),
            GIImageButton(
              onPressed: () {
                context.goNamed('search');
              },
              assetName: 'assets/images/mdi-light_magnify.svg',
            ),
          ],
        ),
      ),
      body: loading
          ? SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 48),
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
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                            width: 1,
                            color: GIColorBlack.grey200,
                          ),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: gallerys.length < 5 ? gallerys.length : 5,
                          itemBuilder: (context, index) => GalleryPreview(
                            title: gallerys[index].name,
                            hot: index + 1,
                          ),
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
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
