import 'package:bloc_firebase/src/constants/sizes.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetPasswordOTPScreen extends StatelessWidget {
  const ForgetPasswordOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  otpTitle,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 80,
                  ),
                ),
                Text(
                  otpSubTitle.toUpperCase(),
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  '${otpMessage}user@email.com',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                PinCodeTextField(
                  length: 6,
                  blinkWhenObscuring: true,
                  appContext: context,
                  keyboardType: TextInputType.number,
                  enableActiveFill: true,
                  animationType: AnimationType.slide,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldWidth: 50,
                    fieldHeight: 60,
                    activeFillColor: Colors.black.withOpacity(0.1),
                    selectedFillColor: Colors.black.withOpacity(0.1),
                    inactiveFillColor: Colors.black.withOpacity(0.1),
                    activeColor: Colors.transparent,
                    inactiveColor: Colors.transparent,
                    selectedColor: Colors.transparent,
                  ),
                  onChanged: (String value) {},
                  onCompleted: (value) {
                    print('OTP is => ${value}');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(next),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
