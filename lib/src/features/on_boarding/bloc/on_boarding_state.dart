part of 'on_boarding_bloc.dart';

abstract class OnBoardingScreenState extends Equatable {
  const OnBoardingScreenState();

  @override
  List<Object> get props => [];
}

abstract class OnBoardingScreenActionState extends OnBoardingScreenState {}

class OnBoardingScreenInitial extends OnBoardingScreenState {}

class OnBoardingScreenChangedPageState extends OnBoardingScreenState {
  final int currentPage;

  const OnBoardingScreenChangedPageState(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}

class OnBoardingScreenNavigateToHomePageActionState
    extends OnBoardingScreenActionState {}
