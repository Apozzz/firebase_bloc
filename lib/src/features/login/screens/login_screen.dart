import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:bloc_firebase/src/constants/sizes.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:bloc_firebase/src/features/login/screens/login_footer_widget.dart';
import 'package:bloc_firebase/src/features/login/screens/login_form_widget.dart';
import 'package:bloc_firebase/src/features/login/screens/login_header_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeaderWidget(size: size),
                const LoginFormWidget(),
                const LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
