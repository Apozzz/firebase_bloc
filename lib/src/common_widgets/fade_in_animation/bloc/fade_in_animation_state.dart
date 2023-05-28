part of 'fade_in_animation_bloc.dart';

abstract class FadeInAnimationState extends Equatable {
  const FadeInAnimationState();

  @override
  List<Object> get props => [];
}

abstract class FadeInAnimationActionState extends FadeInAnimationState {}

class FadeInAnimationInitial extends FadeInAnimationState {}

class FadeInAnimationOnState extends FadeInAnimationState {}

class FadeInAnimationOffState extends FadeInAnimationState {}

class FadeInLoadingState extends FadeInAnimationState {}

class FadeInAnimationEndActionState extends FadeInAnimationActionState {}

class RandEventActionState extends FadeInAnimationActionState {}
