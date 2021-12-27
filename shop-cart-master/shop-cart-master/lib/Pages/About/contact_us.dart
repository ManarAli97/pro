import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shopcart/Components/custom_button.dart';
import 'package:shopcart/Components/drawer.dart';
import 'package:shopcart/Components/entry_field.dart';
import 'package:shopcart/Locale/locales.dart';
import 'package:shopcart/Routes/routes.dart';
import 'package:shopcart/Theme/colors.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text(locale.contactUs!),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        ListView(
          padding: EdgeInsets.zero,
          children: [
            FadedScaleAnimation(
              Image.asset(
                'assets/user_logo.png',
                scale: 2.5,
                height: 280,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                locale.letUsKnowYourFeedbackQueriesIssueRegardingAppFeatures!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 19),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            EntryField(
                labelFontSize: 16,
                controller: TextEditingController()..text = 'Samantha Smith',
                labelFontWeight: FontWeight.w400,
                label: locale.fullName),
            EntryField(
                controller: TextEditingController()..text = '+1 987 654 321',
                labelFontSize: 16,
                labelFontWeight: FontWeight.w400,
                label: locale.phoneNumber),
            EntryField(
                hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: kHintColor,
                    fontSize: 18.3,
                    fontWeight: FontWeight.w400),
                hint: locale.enterYourMessage,
                labelFontSize: 16,
                labelFontWeight: FontWeight.w400,
                label: locale.yourFeedback),
            CustomButton(
              label: locale.submit,
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.homePage);
              },
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
