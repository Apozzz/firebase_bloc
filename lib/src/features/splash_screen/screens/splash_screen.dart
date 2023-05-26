import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:bloc_firebase/src/features/firebase/ui/firebase.dart';
import 'package:bloc_firebase/src/features/on_boarding_screen/screens/on_boarding_screen.dart';
import 'package:bloc_firebase/src/features/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenBloc = SplashScreenBloc();

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    splashScreenBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
      bloc: splashScreenBloc,
      buildWhen: (previous, current) => current is! SplashScreenActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case SplashScreenAnimationChangedState:
            return buildSplashScreenAnimationChangedState(
                state as SplashScreenAnimationChangedState);
          case SplashScreenLoadingState:
            return const SafeArea(
              child: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          default:
            return Text('lol');
        }
      },
      listenWhen: (previous, current) => current is SplashScreenActionState,
      listener: ((context, state) {
        switch (state.runtimeType) {
          case SplashScreenNavigateToFirebaseActionState:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const OnBoardingScreen())),
            );
        }
      }),
    );
  }

  Future<void> startAnimation() async {
    splashScreenBloc.add(SplashScreenAnimationOnEvent());
    await Future.delayed(const Duration(milliseconds: 500));
    splashScreenBloc.add(SplashScreenAnimationOffEvent());
    await Future.delayed(const Duration(milliseconds: 2200));
    splashScreenBloc.add(SplashScreenNavigateToFirebaseEvent());
  }

  Widget buildSplashScreenAnimationChangedState(
      SplashScreenAnimationChangedState state) {
    bool animate = state.animation;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              child: Image(image: AssetImage(splashBackgroundImage)),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2000),
              left: MediaQuery.of(context).size.width / 3.5,
              bottom: animate ? 250 : 0,
              child: AnimatedOpacity(
                opacity: animate ? 1 : 0,
                duration: const Duration(milliseconds: 2000),
                child: const Image(
                  height: 200,
                  width: 200,
                  image: AssetImage(splashImage),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
