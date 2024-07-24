import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gsm_inside_flutter/components/search_components.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final TextEditingController controller = TextEditingController();

  double verticalValue() {
    if (kIsWeb) {
      return 20;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: verticalValue(),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const BackButton(),
                  const SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: GIColorBlack.grey200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            onSubmitted: (term) {},
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '게시판을 찾아보세요',
                              hintStyle: TextStyle(fontSize: 14, color: const Color(0xffadadad), fontFamily: GIFontSize.pretendard_300),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 68,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    const String searchWord = 'ㅋㅋ';
                    return SearchComponents(
                      searchWord: searchWord,
                      index: index,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
