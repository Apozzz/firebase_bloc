part of 'fade_in_animation_bloc.dart';

abstract class FadeInAnimationEvent extends Equatable {
  const FadeInAnimationEvent();

  @override
  List<Object> get props => [];
}

class FadeInAnimationInitialEvent extends FadeInAnimationEvent {}

class FadeInAnimationOnEvent extends FadeInAnimationEvent {}

class FadeInAnimationOffEvent extends FadeInAnimationEvent {}

class FadeInAnimationEndEvent extends FadeInAnimationEvent {}

