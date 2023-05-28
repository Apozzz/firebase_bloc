import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fade_in_animation_event.dart';
part 'fade_in_animation_state.dart';

class FadeInAnimationBloc
    extends Bloc<FadeInAnimationEvent, FadeInAnimationState> {
  FadeInAnimationBloc() : super(FadeInAnimationInitial()) {
    on<FadeInAnimationInitialEvent>(fadeInAnimationInitialEvent);
    on<FadeInAnimationOnEvent>(fadeInAnimationOnEvent);
    on<FadeInAnimationOffEvent>(fadeInAnimationOffEvent);
    on<FadeInAnimationEndEvent>(fadeInAnimationEndEvent);
  }

  FutureOr<void> fadeInAnimationInitialEvent(
      FadeInAnimationEvent event, Emitter<FadeInAnimationState> emit) async {}

  FutureOr<void> fadeInAnimationOnEvent(
      FadeInAnimationEvent event, Emitter<FadeInAnimationState> emit) async {
    emit(FadeInAnimationOnState());
  }

  FutureOr<void> fadeInAnimationEndEvent(
      FadeInAnimationEndEvent event, Emitter<FadeInAnimationState> emit) {
    emit(FadeInAnimationEndActionState());
  }

  FutureOr<void> fadeInAnimationOffEvent(
      FadeInAnimationOffEvent event, Emitter<FadeInAnimationState> emit) {
    emit(FadeInAnimationOffState());
  }
}
