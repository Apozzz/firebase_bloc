part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeGameWishlistButtonClickedEvent extends HomeEvent {
  final GameDataModel clickedGame;

  HomeGameWishlistButtonClickedEvent({required this.clickedGame});
}

class HomeGameCartButtonClickedEvent extends HomeEvent {
  final GameDataModel clickedGame;

  HomeGameCartButtonClickedEvent({required this.clickedGame});
}

class HomeGameWishlistButtonNavigateEvent extends HomeEvent {}

class HomeGameCartButtonNavigateEvent extends HomeEvent {}
