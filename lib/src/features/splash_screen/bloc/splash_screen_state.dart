part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState {}

abstract class SplashScreenActionState extends SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class SplashScreenAnimationChangedState extends SplashScreenState {
  final bool animation;

  SplashScreenAnimationChangedState(this.animation);
}

class SplashScreenLoadingState extends SplashScreenState {}

class SplashScreenNavigateToFirebaseActionState
    extends SplashScreenActionState {}
