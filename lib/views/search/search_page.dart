import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsm_inside_flutter/components/search_components.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/provider/search_history_notifier.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchHistory = ref.watch(searchHistoryProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
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
                            onSubmitted: (term) {
                              ref
                                  .read(searchHistoryProvider.notifier)
                                  .addSearchTerm(term);
                              controller.clear();
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '게시판을 찾아보세요',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: const Color(0xffadadad),
                                  fontFamily: GIFontSize.pretendard_300),
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
                  itemCount: searchHistory.history.length,
                  itemBuilder: (context, index) {
                    final String searchWord = searchHistory.history[index];
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
