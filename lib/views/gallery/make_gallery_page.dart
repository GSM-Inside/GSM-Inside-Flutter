import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsm_inside_flutter/designSystem/gi_color.dart';
import 'package:gsm_inside_flutter/designSystem/gi_fontsize.dart';
import 'package:gsm_inside_flutter/designSystem/gi_text.dart';
import 'package:image_picker/image_picker.dart';

class MakeGalleryPage extends StatefulWidget {
  const MakeGalleryPage({super.key});

  @override
  State<MakeGalleryPage> createState() => _MakeGalleryPageState();
}

class _MakeGalleryPageState extends State<MakeGalleryPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  XFile? _image;
  bool _getImage = false;
  final ImagePicker _picker = ImagePicker();

  getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await _picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      _getImage = true;
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  takeImage(ImageSource imageSource) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _getImage = true;
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const BackButton(),
                  Center(
                    child: GIText(
                      text: '갤러리 만들기',
                      fontSize: GIFontSize.pretendard_600,
                      size: 20,
                      color: GIColorBlack.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              GIText(
                text: '갤러리 대표 사진',
                fontSize: GIFontSize.pretendard_600,
                size: 18,
                color: GIColorBlack.black,
              ),
              const SizedBox(
                height: 20,
              ),
              _getImage
                  ? Image.file(
                      File(_image!.path),
                    )
                  : GestureDetector(
                      onTap: () => showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return CupertinoActionSheet(
                            actions: [
                              CupertinoButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/camera.svg'),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    GIText(
                                      text: '사진찍기',
                                      fontSize: GIFontSize.pretendard_300,
                                      size: 12,
                                      color: GIColorBlack.black,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  takeImage(ImageSource.camera);
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/images/image.svg'),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    GIText(
                                      text: '불러오기',
                                      fontSize: GIFontSize.pretendard_300,
                                      size: 12,
                                      color: GIColorBlack.black,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  getImage(ImageSource.gallery);
                                },
                              ),
                              CupertinoButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/images/trash.svg'),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    GIText(
                                      text: '삭제하기',
                                      fontSize: GIFontSize.pretendard_300,
                                      size: 12,
                                      color: GIColorSystem.error,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    _image = null;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      child: Container(
                        height: 48,
                        width: 140,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: GIColorBlack.grey200,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              color: GIColorBlack.grey600,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            GIText(
                              text: '사진 가져오기',
                              fontSize: GIFontSize.pretendard_300,
                              size: 14,
                              color: GIColorBlack.grey500,
                            ),
                          ],
                        ),
                      ),
                    ),
              const SizedBox(height: 30),
              GIText(
                text: '갤러리 이름',
                fontSize: GIFontSize.pretendard_600,
                size: 18,
                color: GIColorBlack.black,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 41,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        color: GIColorBlack.grey200,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '게시판을 찾아보세요',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: const Color(0xffadadad),
                            fontFamily: GIFontSize.pretendard_300),
                      ),
                      cursorColor: Colors.black,
                      controller: _titleController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GIText(
                text: '갤러리 목적',
                fontSize: GIFontSize.pretendard_600,
                size: 18,
                color: GIColorBlack.black,
              ),
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 179,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        color: GIColorBlack.grey200,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '게시판을 찾아보세요',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: const Color(0xffadadad),
                            fontFamily: GIFontSize.pretendard_300),
                      ),
                      cursorColor: Colors.black,
                      controller: _reasonController,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                alignment: Alignment.center,
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: GIColorMain.main600_05A4E9,
                ),
                child: GIText(
                  text: '완료',
                  fontSize: GIFontSize.pretendard_600,
                  size: 16,
                  color: GIColorBlack.white,
                ),
              ),
              const SizedBox(
                height: 47,
              )
            ],
          ),
        ),
      ),
    );
  }
}
