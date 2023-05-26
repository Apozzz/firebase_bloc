import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          const Image(image: AssetImage(welcomeScreenImage)),
          const Text(welcomeTitle),
          const Text(welcomeSubtitle),
          Row(
            children: [
              OutlinedButton(
                  onPressed: () {
                    return;
                  },
                  child: const Text(login)),
              ElevatedButton(
                  onPressed: () {
                    return;
                  },
                  child: const Text(signup)),
            ],
          )
        ],
      ),
    ));
  }
}
