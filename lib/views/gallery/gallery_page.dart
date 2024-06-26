import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/components/board_preview.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final String _title = '잡담갤러리갤';
  int _value = 0;
  final List<String> _valueList = ['최신순', '인기순'];

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    const BackButton(),
                    Center(
                      child: GIText(
                        text: _title,
                        fontSize: GIFontSize.pretendard_600,
                        size: 20,
                        color: GIColorBlack.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GIText(
                      text: '게시판',
                      fontSize: GIFontSize.pretendard_600,
                      size: 20,
                      color: GIColorBlack.black,
                    ),
                    CupertinoButton(
                      child: Row(
                        children: [
                          GIText(
                            text: _valueList[_value],
                            fontSize: GIFontSize.pretendard_300,
                            size: 12,
                            color: GIColorBlack.black,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: GIColorBlack.black,
                          )
                        ],
                      ),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoActionSheet(
                              actions: [
                                CupertinoButton(
                                  child: GIText(
                                    text: _valueList[0],
                                    fontSize: GIFontSize.pretendard_300,
                                    size: 12,
                                    color: GIColorBlack.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _value = 0;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoButton(
                                  child: GIText(
                                    text: _valueList[1],
                                    fontSize: GIFontSize.pretendard_300,
                                    size: 12,
                                    color: GIColorBlack.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _value = 1;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
                const BoardPreview(),
                const BoardPreview(),
                const BoardPreview(),
                const BoardPreview(),
                const BoardPreview(),
                const BoardPreview(),
                const BoardPreview(),
                const BoardPreview(),
                const BoardPreview(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        height: 48,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: GIColorMain.main600_05A4E9,
        ),
        child: Row(
          children: [SvgPicture.asset('assets/images/write_comment.svg')],
        ),
      ),
    );
  }
}
