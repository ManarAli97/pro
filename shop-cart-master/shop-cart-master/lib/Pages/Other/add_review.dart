import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopcart/Components/custom_button.dart';
import 'package:shopcart/Components/entry_field.dart';
import 'package:shopcart/Locale/locales.dart';
import 'package:shopcart/Pages/Other/product_info.dart';
import 'package:shopcart/Routes/routes.dart';

class AddReviewPage extends StatefulWidget {
  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.7,
                    ),
                    Image.asset(
                      'assets/header.png',
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                    Positioned.directional(
                        top: 70,
                        textDirection: TextDirection.ltr,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        )),
                    Positioned.directional(
                      top: 90,
                      start: MediaQuery.of(context).size.width / 3,
                      textDirection: TextDirection.ltr,
                      child: Text(
                        locale.addReview!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.7),
                      ),
                    ),
                    Positioned.directional(
                        top: 150,
                        start: MediaQuery.of(context).size.width / 2.8,
                        textDirection: TextDirection.ltr,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductInfo()));
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/ProductImages/item4.png',
                                height: 110,
                                fit: BoxFit.fitHeight,
                              )),
                        ))
                  ],
                ),
                Text(
                  locale.blackCottonTop!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Theme.of(context).backgroundColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Operum England',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  locale.howWasYourExperience!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.grey[500], fontSize: 18),
                ),
                SizedBox(
                  height: 24,
                ),
                Center(
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  color: Colors.grey[200],
                  thickness: 5,
                ),
                SizedBox(
                  height: 24,
                ),
                EntryField(
                  labelFontWeight: FontWeight.w300,
                  labelFontSize: 18,
                  label: locale.writeYourFeedback,
                  hint: locale.enterYourReview,
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: CustomButton(
                label: 'Save Address'.toUpperCase(),
                onTap: () => Navigator.pushNamed(context, PageRoutes.homePage),
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
