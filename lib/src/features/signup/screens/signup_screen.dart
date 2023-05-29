import 'package:bloc_firebase/src/common_widgets/form/screens/form_header_widget.dart';
import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:bloc_firebase/src/constants/sizes.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:bloc_firebase/src/features/signup/screens/signup_footer_widget.dart';
import 'package:bloc_firebase/src/features/signup/screens/signup_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: const Column(
              children: [
                FormHeaderWidget(
                  image: welcomeScreenImage,
                  title: signUpTitle,
                  subtitle: signUpSubTitle,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
