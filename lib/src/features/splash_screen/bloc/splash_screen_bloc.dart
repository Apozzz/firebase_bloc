import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenInitialEvent>(splashScreenInitialEvent);
    on<SplashScreenAnimationOnEvent>(splashScreenAnimationOnEvent);
    on<SplashScreenAnimationOffEvent>(splashScreenAnimationOffEvent);
    on<SplashScreenNavigateToFirebaseEvent>(
        splashScreenNavigateToFirebaseEvent);
  }

  FutureOr<void> splashScreenInitialEvent(
      SplashScreenInitialEvent event, Emitter<SplashScreenState> emit) async {}

  FutureOr<void> splashScreenAnimationOnEvent(
      SplashScreenAnimationOnEvent event,
      Emitter<SplashScreenState> emit) async {
    emit(SplashScreenAnimationChangedState(false));
  }

  FutureOr<void> splashScreenAnimationOffEvent(
      SplashScreenAnimationOffEvent event,
      Emitter<SplashScreenState> emit) async {
    emit(SplashScreenAnimationChangedState(true));
  }

  FutureOr<void> splashScreenNavigateToFirebaseEvent(
      SplashScreenNavigateToFirebaseEvent event,
      Emitter<SplashScreenState> emit) async {
    emit(SplashScreenNavigateToFirebaseActionState());
  }
}
