import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopcart_delivery/Auth/login_navigator.dart';
import 'package:shopcart_delivery/Components/custom_button.dart';
import 'package:shopcart_delivery/Components/entry_field.dart';
import 'package:shopcart_delivery/Locale/locales.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    //var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(top: 48.0, left: 0, right: 0),
              children: [
                Text(
                  locale.welcomeTo!,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 24,
                ),
                FadedScaleAnimation(
                  Image.asset(
                    "assets/delivery_logo.png",
                    /* scale: 2.5,*/ height: 150,
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                EntryField(
                  label: locale.selectCountry,
                  hint: locale.selectCountry,
                  suffixIcon: (Icons.arrow_drop_down),
                ),
                EntryField(
                  label: locale.phoneNumber,
                  hint: locale.enterPhoneNumber,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomButton(
                  onTap: () =>
                      Navigator.pushNamed(context, SignInRoutes.signUp),
                ),
                SizedBox(
                  height: 48,
                ),
                Text(
                  locale.wellSendOTPForVerification!,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 48,
                ),
                Text(
                  locale.orContinueWith!,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 48,
                ),
              ],
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      label: 'Facebook',
                      color: Color(0xff3b45c1),
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      label: 'Google',
                      color: Color(0xffff452c),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
