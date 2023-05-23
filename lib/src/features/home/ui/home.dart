import 'package:bloc_firebase/src/features/cart/ui/cart.dart';
import 'package:bloc_firebase/src/features/home/bloc/home_bloc.dart';
import 'package:bloc_firebase/src/features/home/ui/game_tile_widget.dart';
import 'package:bloc_firebase/src/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        switch (state.runtimeType) {
          case HomeNavigateToCartPageActionState:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Cart(),
                ));

            break;
          case HomeNavigateToWishlistPageActionState:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Wishlist(),
                ));

            break;
          case HomeGameWishlistAddedState:
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Game Added To Wishlist')));

            break;
          case HomeGameCartAddedState:
           ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Game Added To Cart')));

            break;
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Game App'),
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(
                      onPressed: () {
                        //homeBloc.add(HomeGameWishlistButtonClickedEvent());
                      },
                      icon: const Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        //homeBloc.add(HomeGameCartButtonClickedEvent());
                      },
                      icon: const Icon(Icons.shop)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.games.length,
                  itemBuilder: (context, index) {
                    return GameTileWidget(
                        homeBloc: homeBloc,
                        gameDataModel: successState.games[index]);
                  }),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
