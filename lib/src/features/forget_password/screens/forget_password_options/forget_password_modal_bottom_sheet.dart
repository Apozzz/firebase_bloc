import 'package:bloc_firebase/src/constants/sizes.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:bloc_firebase/src/features/forget_password/screens/forget_password_mail/forget_password_mail.dart';
import 'package:bloc_firebase/src/features/forget_password/screens/forget_password_options/forget_password_button_widget.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalButtonSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(forgetPasswordTitle,
                style: Theme.of(context).textTheme.headline2),
            Text(forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyText2),
            const SizedBox(
              height: formHeight,
            ),
            ForgetPasswordButtonWidget(
              buttonIcon: Icons.mail_outline_rounded,
              title: email,
              subTitle: resetViaEMail,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const ForgetPasswordMailScreen()),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ForgetPasswordButtonWidget(
              buttonIcon: Icons.mobile_friendly_rounded,
              title: phoneNo,
              subTitle: resetViaPhone,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
