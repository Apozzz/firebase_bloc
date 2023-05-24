import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_screen_event.dart';
part 'on_boarding_screen_state.dart';

class OnBoardingScreenBloc extends Bloc<OnBoardingScreenEvent, OnBoardingScreenState> {
  OnBoardingScreenBloc() : super(OnBoardingScreenInitial()) {
    on<OnBoardingScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
