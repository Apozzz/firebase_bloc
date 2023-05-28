import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: const AssetImage(welcomeScreenImage),
          height: size.height * 0.2,
        ),
        Text(loginTitle, style: Theme.of(context).textTheme.headline1),
        Text(loginSubTitle, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
