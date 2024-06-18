import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/components/search.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    double widthMediaQuery = mediaQuery.width / 1.4;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/arrow.svg',
                    width: 36,
                    height: 36,
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: widthMediaQuery,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: GIColorBlack.grey200,
                    ),
                    child: CupertinoTextField(
                      placeholderStyle: TextStyle(
                          fontSize: 14,
                          color: const Color(0xffadadad),
                          fontFamily: GIFontSize.pretendard_300),
                      placeholder: "게시판을 찾아보세요",
                      decoration: const BoxDecoration(),
                      cursorColor: Colors.black,
                      controller: _controller,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 68,
              ),
              const Search(searchWord: '검색어')
            ],
          ),
        ),
      ),
    );
  }
}
