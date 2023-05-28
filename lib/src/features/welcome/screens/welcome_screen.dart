import 'package:bloc_firebase/src/common_widgets/fade_in_animation/controller/fade_in_animation_controller.dart';
import 'package:bloc_firebase/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:bloc_firebase/src/common_widgets/fade_in_animation/bloc/fade_in_animation_bloc.dart';
import 'package:bloc_firebase/src/common_widgets/fade_in_animation/models/fade_in_animation_model.dart';
import 'package:bloc_firebase/src/constants/colors.dart';
import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:bloc_firebase/src/constants/sizes.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:bloc_firebase/src/features/firebase/ui/firebase.dart';
import 'package:bloc_firebase/src/features/login/screens/login_screen.dart';
import 'package:bloc_firebase/src/features/welcome/bloc/welcome_bloc.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final welcomeBloc = WelcomeBloc();
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var height = mediaQuery.size.height;
    final isDarkMode = brightness == Brightness.dark;
    final fadeInAnimationBloc = BlocProvider.of<FadeInAnimationBloc>(context);
    FadeInAnimationController(500, 1400, fadeInAnimationBloc).startAnimation();

    return BlocListener<WelcomeBloc, WelcomeState>(
      bloc: welcomeBloc,
      listenWhen: (previous, current) => current is WelcomeActionState,
      listener: ((context, state) {
        switch (state.runtimeType) {
          case WelcomeNavigateToLoginActionState:
            Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => const LoginScreen())),
            );
        }
      }),
      child: BlocBuilder<FadeInAnimationBloc, FadeInAnimationState>(
        bloc: fadeInAnimationBloc,
        buildWhen: (previous, current) =>
            current is! FadeInAnimationActionState,
        builder: ((context, state) {
          switch (state.runtimeType) {
            case FadeInAnimationOnState:
              return buildWelcomeScreenAnimation(
                  welcomeBloc, false, isDarkMode, height, context);
            case FadeInAnimationOffState:
              return buildWelcomeScreenAnimation(
                  welcomeBloc, true, isDarkMode, height, context);
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        }),
      ),
    );
  }

  Widget buildWelcomeScreenAnimation(WelcomeBloc welcomeBloc, bool animation,
      bool isDarkMode, double height, BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      body: Stack(
        children: [
          FadeInAnimation(
            animatePosition: AnimatePosition(
              topAfter: 0,
              topBefore: 0,
              bottomAfter: 0,
              bottomBefore: -100,
              leftAfter: 0,
              leftBefore: 0,
              rightAfter: 0,
              rightBefore: 0,
            ),
            animation: animation,
            durationMs: 1200,
            child: Container(
              padding: const EdgeInsets.all(defaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: const AssetImage(welcomeScreenImage),
                    height: height * 0.6,
                  ),
                  Column(
                    children: [
                      Text(welcomeTitle,
                          style: Theme.of(context).textTheme.headlineSmall),
                      Text(
                        welcomeSubtitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            welcomeBloc.add(WelcomeNavigateToLoginEvent());
                          },
                          child: Text(login.toUpperCase()),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            welcomeBloc.add(WelcomeNavigateToSignUpEvent());
                          },
                          child: Text(signup.toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
