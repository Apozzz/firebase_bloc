import 'package:bloc_firebase/src/constants/sizes.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:bloc_firebase/src/features/forget_password/screens/forget_password_options/forget_password_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: email,
                hintText: email,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: formHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: password,
                hintText: password,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(
              height: formHeight - 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalButtonSheet(context);
                },
                child: const Text(
                  forgetPassword,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  login.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
