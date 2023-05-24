import 'package:bloc_firebase/src/constants/sizes.dart';
import 'package:bloc_firebase/src/features/on_boarding_screen/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({super.key, required this.model});

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: model.height * 0.35,
          ),
          const SizedBox(height: 60),
          Text(
            model.title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            model.subtitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 70),
          Text(model.counterText),
          const Spacer(),
        ],
      ),
    );
  }
}
