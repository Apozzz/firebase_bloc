import 'package:bloc_firebase/src/common_widgets/fade_in_animation/bloc/fade_in_animation_bloc.dart';
import 'package:flutter/material.dart';

class FadeInAnimationController {
  const FadeInAnimationController(this.firstDelay, this.lastDelay, this.bloc);

  final int firstDelay;
  final int lastDelay;
  final FadeInAnimationBloc bloc;

  Future<void> startSplashAnimation() async {
    bloc.add(FadeInAnimationOnEvent());
    await Future.delayed(Duration(milliseconds: firstDelay));
    bloc.add(FadeInAnimationOffEvent());
    await Future.delayed(Duration(milliseconds: lastDelay));
    bloc.add(FadeInAnimationEndEvent());
  }

  Future<void> startAnimation() async {
    bloc.add(FadeInAnimationOnEvent());
    await Future.delayed(Duration(milliseconds: firstDelay));
    bloc.add(FadeInAnimationOffEvent());
    await Future.delayed(Duration(milliseconds: lastDelay));
  }
}
