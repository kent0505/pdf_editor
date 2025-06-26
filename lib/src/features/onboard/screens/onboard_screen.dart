import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../home/screens/home_screen.dart';
import '../data/onboard_repository.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  static const routePath = '/OnboardScreen';

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int index = 0;

  final pageController = PageController();

  void onNext() async {
    if (index == 2) {
      await context.read<OnboardRepository>().removeOnboard();
      if (mounted) {
        context.go(HomeScreen.routePath);
      }
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        index++;
      });
    }
  }

  void onPageChanged(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE12426),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            top: 118,
            left: -28,
            child: ImageWidget(
              Assets.onboard1,
              width: 330,
            ),
          ),
          const Positioned(
            top: 118,
            right: -77,
            child: ImageWidget(
              Assets.onboard1,
              width: 330,
            ),
          ),
          Container(
            color: Color(0xffE12426).withValues(alpha: 0.4),
          ),
          PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 98,
                    left: 22,
                    right: 22,
                    child: ImageWidget(
                      Assets.onboard1,
                      width: 330,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned(
                    bottom: 300,
                    left: 3,
                    right: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const ImageWidget(
                        Assets.onboard3,
                        width: 330,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  const Positioned(
                    top: 78,
                    left: 20,
                    right: 20,
                    child: ImageWidget(
                      Assets.onboard2,
                      width: 330,
                    ),
                  ),
                  Positioned(
                    top: 226,
                    left: 10,
                    child: Container(
                      height: 95,
                      width: 188,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffE12426).withValues(alpha: 0.25),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: SvgWidget(Assets.onboard6),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 300,
                    right: 14,
                    child: Container(
                      height: 95,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffE12426).withValues(alpha: 0.25),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Center(
                          child: ImageWidget(Assets.onboard4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned(
                    top: 98,
                    left: 22,
                    right: 22,
                    child: ImageWidget(
                      Assets.onboard1,
                      width: 330,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned(
                    top: 56,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 30,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const SvgWidget(Assets.onboard7),
                    ),
                  ),
                  Positioned(
                    bottom: 260,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 20,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const SvgWidget(Assets.onboard8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 240,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  )
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      index == 0
                          ? 'Edit PDF Text'
                          : index == 1
                              ? 'Fill & Sign PDF'
                              : 'Organize PDF Pages',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: AppFonts.w700,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      index == 0
                          ? 'Edit text and content directly in your PDF documents'
                          : index == 1
                              ? 'Edit, annotate or sign your PDF documents'
                              : 'Rearrange, rotate, or delete pages in your PDF files quickly and easily.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff808080),
                        fontSize: 14,
                        fontFamily: AppFonts.w400,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: const ScaleEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 10,
                        dotColor: Color(0xffD9D9D9),
                        activeDotColor: Color(0xffE12426),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MainButton(
                    title: 'Continue',
                    onPressed: onNext,
                  ),
                  const SizedBox(height: 44),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
