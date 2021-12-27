import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shopcart/Auth/login_navigator.dart';
import 'package:shopcart/Components/custom_button.dart';
import 'package:shopcart/Components/entry_field.dart';
import 'package:shopcart/Locale/locales.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.register!),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FadedSlideAnimation(
            ListView(
              padding: EdgeInsets.zero,
              children: [
                EntryField(
                  label: locale.fullName,
                  hint: locale.enterFullName,
                  suffixIcon: (Icons.person),
                ),
                EntryField(
                  label: locale.emailAddress,
                  hint: locale.enterEmailAddress,
                  suffixIcon: (Icons.email),
                ),
                EntryField(
                  label: locale.selectCountry,
                  hint: locale.selectCountry,
                  suffixIcon: Icons.arrow_drop_down,
                ),
                EntryField(
                  label: locale.phoneNumber,
                  hint: locale.enterPhoneNumber,
                  suffixIcon: (Icons.phone),
                ),
              ],
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: CustomButton(
              onTap: () =>
                  Navigator.pushNamed(context, SignInRoutes.verification),
            ),
          )
        ],
      ),
    );
  }
}
