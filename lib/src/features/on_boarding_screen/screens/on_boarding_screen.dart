import 'package:bloc_firebase/src/constants/colors.dart';
import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:bloc_firebase/src/features/firebase/ui/firebase.dart';
import 'package:bloc_firebase/src/features/on_boarding_screen/bloc/on_boarding_screen_bloc.dart';
import 'package:bloc_firebase/src/features/on_boarding_screen/models/on_boarding_model.dart';
import 'package:bloc_firebase/src/features/on_boarding_screen/screens/on_boarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();
  final onBoardingScreenBloc = OnBoardingScreenBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    onBoardingScreenBloc.close();
    super.dispose();
  }

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

    return BlocListener(
      bloc: onBoardingScreenBloc,
      listenWhen: (previous, current) => current is OnBoardingScreenActionState,
      listener: ((context, state) {
        switch (state.runtimeType) {
          case OnBoardingScreenNavigateToHomePageActionState:
            Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => const FireBase())),
            );
        }
      }),
      child: Scaffold(
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
            BlocBuilder(
                bloc: onBoardingScreenBloc,
                buildWhen: (previous, current) =>
                    current is! OnBoardingScreenActionState,
                builder: (context, state) {
                  return buildNextButton(state);
                }),
            Positioned(
              top: 50,
              left: 10,
              child: TextButton(
                onPressed: () => onBoardingScreenBloc
                    .add(OnBoardingScreenPressedCloseButtonEvent()),
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 10,
              child: TextButton(
                onPressed: () => controller.jumpToPage(page: 2),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            BlocBuilder(
                bloc: onBoardingScreenBloc,
                buildWhen: (previous, current) =>
                    current is! OnBoardingScreenActionState,
                builder: (context, state) {
                  return buildAnimatedSmoothIndicator(state);
                }),
          ],
        ),
      ),
    );
  }

  void onPageChangedCallback(int activePageIndex) {
    onBoardingScreenBloc.add(OnBoardingScreenChangedPageEvent(activePageIndex));
  }

  Widget buildAnimatedSmoothIndicator(state) {
    int currentPage = 0;

    if (state is OnBoardingScreenChangedPageState) {
      currentPage = state.currentPage;
    }

    return Positioned(
      bottom: 10,
      child: AnimatedSmoothIndicator(
        count: 3,
        activeIndex: currentPage,
        effect: const WormEffect(
          activeDotColor: secondaryColor,
          dotHeight: 5,
        ),
      ),
    );
  }

  Widget buildNextButton(state) {
    int nextPage = 1;

    if (state is OnBoardingScreenChangedPageState) {
      nextPage = state.currentPage + 1;
    }

    return Positioned(
      bottom: 60.0,
      child: OutlinedButton(
        onPressed: () {
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
    );
  }
}
