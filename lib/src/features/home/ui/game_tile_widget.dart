import 'package:bloc_firebase/src/features/home/bloc/home_bloc.dart';
import 'package:bloc_firebase/src/features/home/model/home_game_data_model.dart';
import 'package:flutter/material.dart';

class GameTileWidget extends StatelessWidget {
  final GameDataModel gameDataModel;
  final HomeBloc homeBloc;
  const GameTileWidget(
      {super.key, required this.gameDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(gameDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            gameDataModel.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(gameDataModel.description),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                gameDataModel.rating,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.star_border_rounded),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeGameWishlistButtonClickedEvent(clickedGame: gameDataModel));
                  },
                  icon: const Icon(Icons.favorite_border_outlined)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeGameCartButtonClickedEvent(clickedGame: gameDataModel));
                  },
                  icon: const Icon(Icons.shop)),
            ],
          ),
        ],
      ),
    );
  }
}
