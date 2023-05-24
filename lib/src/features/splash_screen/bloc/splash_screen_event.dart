part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashScreenInitialEvent extends SplashScreenEvent {}

class SplashScreenAnimationOnEvent extends SplashScreenEvent {}

class SplashScreenAnimationOffEvent extends SplashScreenEvent {}

class SplashScreenNavigateToFirebaseEvent extends SplashScreenEvent {}
