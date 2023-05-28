import 'package:bloc_firebase/src/common_widgets/fade_in_animation/controller/fade_in_animation_controller.dart';
import 'package:bloc_firebase/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:bloc_firebase/src/common_widgets/fade_in_animation/bloc/fade_in_animation_bloc.dart';
import 'package:bloc_firebase/src/common_widgets/fade_in_animation/models/fade_in_animation_model.dart';
import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:bloc_firebase/src/features/firebase/ui/firebase.dart';
import 'package:bloc_firebase/src/features/on_boarding/screens/on_boarding_screen.dart';
import 'package:bloc_firebase/src/features/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final fadeInAnimationBloc = BlocProvider.of<FadeInAnimationBloc>(context);
    FadeInAnimationController(500, 2200, fadeInAnimationBloc)
        .startSplashAnimation();

    return BlocConsumer<FadeInAnimationBloc, FadeInAnimationState>(
      bloc: fadeInAnimationBloc,
      buildWhen: (previous, current) => current is! FadeInAnimationActionState,
      builder: ((context, state) {
        switch (state.runtimeType) {
          case FadeInAnimationOnState:
            return buildSplashScreenAnimationChangedState(false);
          case FadeInAnimationOffState:
            return buildSplashScreenAnimationChangedState(true);
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      }),
      listenWhen: (previous, current) => current is FadeInAnimationActionState,
      listener: ((context, state) {
        switch (state.runtimeType) {
          case FadeInAnimationEndActionState:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const OnBoardingScreen())),
            );
        }
      }),
    );
  }

  Widget buildSplashScreenAnimationChangedState(bool animation) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              child: Image(image: AssetImage(splashBackgroundImage)),
            ),
            FadeInAnimation(
              animatePosition: AnimatePosition(
                bottomBefore: 0,
                bottomAfter: 250,
                leftBefore: width / 3.5,
                leftAfter: width / 3.5,
              ),
              animation: animation,
              durationMs: 2000,
              child: const Image(
                height: 200,
                width: 200,
                image: AssetImage(splashImage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
