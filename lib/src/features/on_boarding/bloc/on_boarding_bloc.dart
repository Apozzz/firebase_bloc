import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingScreenBloc
    extends Bloc<OnBoardingScreenEvent, OnBoardingScreenState> {
  OnBoardingScreenBloc() : super(OnBoardingScreenInitial()) {
    on<OnBoardingScreenEvent>(onBoardingScreenEvent);
    on<OnBoardingScreenChangedPageEvent>(onBoardingScreenChangedPageEvent);
    on<OnBoardingScreenPressedCloseButtonEvent>(
        onBoardingScreenPressedCloseButtonEvent);
  }

  FutureOr<void> onBoardingScreenChangedPageEvent(
      OnBoardingScreenChangedPageEvent event,
      Emitter<OnBoardingScreenState> emit) {
    emit(OnBoardingScreenChangedPageState(event.currentPage));
  }

  FutureOr<void> onBoardingScreenEvent(
      OnBoardingScreenEvent event, Emitter<OnBoardingScreenState> emit) {}

  FutureOr<void> onBoardingScreenPressedCloseButtonEvent(
      OnBoardingScreenPressedCloseButtonEvent event,
      Emitter<OnBoardingScreenState> emit) {
    emit(OnBoardingScreenNavigateToHomePageActionState());
  }
}
