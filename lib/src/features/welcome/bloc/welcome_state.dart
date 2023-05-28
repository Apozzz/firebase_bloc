part of 'welcome_bloc.dart';

abstract class WelcomeState extends Equatable {
  const WelcomeState();
  
  @override
  List<Object> get props => [];
}

abstract class WelcomeActionState extends WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class WelcomeNavigateToLoginActionState extends WelcomeActionState {}

class WelcomeNavigateToSignUpActionState extends WelcomeActionState {}