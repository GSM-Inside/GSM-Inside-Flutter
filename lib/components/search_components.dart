import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';
import 'package:gsm_inside_flutter/provider/search_history_notifier.dart';

class SearchComponents extends ConsumerWidget {
  final String searchWord;
  final int index;
  const SearchComponents({
    super.key,
    required this.searchWord,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Container(
            decoration: const BoxDecoration(),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/circle.svg'),
                const SizedBox(
                  width: 25,
                ),
                GIText(
                  text: searchWord,
                  fontSize: GIFontSize.pretendard_300,
                  size: 14,
                  color: GIColorBlack.black,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            ref.read(searchHistoryProvider.notifier).removeSearchTerm(index);
          },
          child: SvgPicture.asset('assets/images/delete.svg'),
        )
      ],
    );
  }
}
