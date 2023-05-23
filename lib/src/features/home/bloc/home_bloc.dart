import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_firebase/src/data/cart_items.dart';
import 'package:bloc_firebase/src/data/games_list.dart';
import 'package:bloc_firebase/src/data/wishlist_items.dart';
import 'package:bloc_firebase/src/features/home/model/home_game_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeGameWishlistButtonClickedEvent>(homeGameWishlistButtonClickedEvent);
    on<HomeGameCartButtonClickedEvent>(homeGameCartButtonClickedEvent);
    on<HomeGameWishlistButtonNavigateEvent>(
        homeGameWishlistButtonNavigateEvent);
    on<HomeGameCartButtonNavigateEvent>(homeGameCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        games: GameData.gameList
            .map((e) => GameDataModel(
                  e['id'],
                  e['name'],
                  e['category'],
                  e['description'],
                  e['rating'],
                  e['imageUrl'],
                ))
            .toList(),
      ),
    );
  }

  FutureOr<void> homeGameWishlistButtonClickedEvent(
      HomeGameWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist Game Clicked');
    wishlistItems.add(event.clickedGame);
    emit(HomeGameWishlistAddedState());
  }

  FutureOr<void> homeGameCartButtonClickedEvent(
      HomeGameCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Game Clicked');
    cartItems.add(event.clickedGame);
    emit(HomeGameCartAddedState());
  }

  FutureOr<void> homeGameCartButtonNavigateEvent(
      HomeGameCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate Clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeGameWishlistButtonNavigateEvent(
      HomeGameWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist Navigate Clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }
}
