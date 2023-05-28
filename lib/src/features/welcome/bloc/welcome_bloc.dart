import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    on<WelcomeNavigateToLoginEvent>(welcomeNavigateToLoginEvent);
    on<WelcomeNavigateToSignUpEvent>(welcomeNavigateToSignUpEvent);
  }

  FutureOr<void> welcomeNavigateToLoginEvent(
      WelcomeNavigateToLoginEvent event, Emitter<WelcomeState> emit) {
    emit(WelcomeNavigateToLoginActionState());
  }

  FutureOr<void> welcomeNavigateToSignUpEvent(
      WelcomeNavigateToSignUpEvent event, Emitter<WelcomeState> emit) {
    emit(WelcomeNavigateToSignUpActionState());
  }
}
