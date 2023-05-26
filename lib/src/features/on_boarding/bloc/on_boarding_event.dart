part of 'on_boarding_bloc.dart';

abstract class OnBoardingScreenEvent extends Equatable {
  const OnBoardingScreenEvent();

  @override
  List<Object> get props => [];
}

class OnBoardingScreenChangedPageEvent extends OnBoardingScreenEvent {
  final int currentPage;

  const OnBoardingScreenChangedPageEvent(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}

class OnBoardingScreenPressedCloseButtonEvent extends OnBoardingScreenEvent {}
