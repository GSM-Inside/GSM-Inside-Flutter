import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_image.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              GITextBlack(
                text: '인기 게시판',
                fontSize: FontSize.pretendard_600,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
