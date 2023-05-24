import 'package:bloc_firebase/src/constants/colors.dart';
import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:bloc_firebase/src/features/on_boarding_screen/models/on_boarding_model.dart';
import 'package:bloc_firebase/src/features/on_boarding_screen/screens/on_boarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<Widget> pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
          onBoardingImageOne,
          onBoardingTitleOne,
          onBoardingSubtitleOne,
          onBoardingCounterOne,
          onBoardingPageOneColor,
          size.height,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          onBoardingImageTwo,
          onBoardingTitleTwo,
          onBoardingSubtitleTwo,
          onBoardingCounterTwo,
          onBoardingPageTwoColor,
          size.height,
        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          onBoardingImageThree,
          onBoardingTitleThree,
          onBoardingSubtitleThree,
          onBoardingCounterThree,
          onBoardingPageThreeColor,
          size.height,
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            liquidController: controller,
            onPageChangeCallback: onPageChangedCallback,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () {
                int nextPage = controller.currentPage + 1;
                controller.animateToPage(page: nextPage);
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: darkColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => controller.jumpToPage(page: 2),
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              count: 3,
              activeIndex: controller.currentPage,
              effect: const WormEffect(
                activeDotColor: secondaryColor,
                dotHeight: 5,
              ),
            ),
          )
        ],
      ),
    );
  }

  void onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
