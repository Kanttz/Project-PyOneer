import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pyoneer/utils/lesson_component.dart';
import 'package:pyoneer/utils/text.dart';

class Lesson1Screen extends StatefulWidget {
  const Lesson1Screen({super.key});

  @override
  State<Lesson1Screen> createState() => _Lesson1ScreenState();
}

class _Lesson1ScreenState extends State<Lesson1Screen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _titleFadeAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<double> _contentFadeAnimation;
  late Animation<Offset> _contentSlideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _titleFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _titleSlideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _contentFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );
    _contentSlideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LessonComponent.lessonsAppbar('Lesson 1'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LessonComponent.lessonCover(
                      'assets/images/lesson1/cover.jpg')),
              const SizedBox(height: 25),
              SlideTransition(
                position: _titleSlideAnimation,
                child: FadeTransition(
                  opacity: _titleFadeAnimation,
                  child: const Text(
                    "Python คืออะไร",
                    style: TextStyle(
                      fontSize: PyoneerText.titleTextSize,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SlideTransition(
                position: _contentSlideAnimation,
                child: FadeTransition(
                  opacity: _contentFadeAnimation,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: <Widget>[
                        const Text(
                            "- คุณลักษณะของภาษาไพทอน\n\n\t\t\t\tภาษาไพทอนเป็นภาษาที่นำลักษณะที่ดีของภาษาที่มีอยู่ก่อนแล้ว\nคือ ABC, Modula-3, C, C++, Algol-68, SmallTalk and Unix shell and other scripting languages และเพิ่มคุณลักษณะที่ดี เช่น คลาสและอื่นๆ รวมถึงมี interface ที่เข้าใจได้ง่ายทำให้การเขียนโปรแกรมสะดวกมากขึ้น ภาษาไพทอนเป็นภาษาระดับสูง และจัดอยู่ในกลุ่มภาษา Interpreter คือ แปลแล้วทำงานทีละคำสั่ง มีการประมวลผลทันที (process at runtime) นอกจากนี้ยังมีลักษณะ interactive คือ เราสามารถพิมพ์คำสั่ง ทำงานในลักษณะตอบโต้ได้ และเป็นภาษาที่ได้รับความนิยม เรียนรู้ได้ง่าย เหมาะกับผู้เริ่มต้นเขียนโปรแกรม",
                            textAlign: TextAlign.left),
                        const SizedBox(height: 25),
                        const Text(
                            "ภาษาไพทอนเป็นภาษาระดับสูง และจัดอยู่ในกลุ่มภาษา Interpreter คือ แปลแล้วทำงานทีละคำสั่ง มีการประมวลผลทันที (process at runtime) นอกจากนี้ยังมีลักษณะ interactive คือ เราสามารถพิมพ์คำสั่ง ทำงานในลักษณะตอบโต้ได้ และเป็นภาษาที่ได้รับความนิยม เรียนรู้ได้ง่าย เหมาะกับผู้เริ่มต้นเขียนโปรแกรม",
                            textAlign: TextAlign.left),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierColor: Colors.transparent,
                              builder: (BuildContext context) {
                                var screenSize = MediaQuery.of(context).size;

                                var width = screenSize.width;
                                var height = screenSize.height;

                                return BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Dialog(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        width: width,
                                        height: height,
                                        child: PhotoView(
                                          imageProvider: const AssetImage(
                                            "assets/images/lesson1/lessonImage1.jpg",
                                          ),
                                          minScale:
                                              PhotoViewComputedScale.contained *
                                                  0.5,
                                          maxScale:
                                              PhotoViewComputedScale.covered *
                                                  4.0,
                                          initialScale:
                                              PhotoViewComputedScale.contained,
                                          backgroundDecoration:
                                              const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          basePosition: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            "assets/images/lesson1/lessonImage1.jpg",
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Text('Image not found');
                            },
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
