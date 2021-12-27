import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shopcart/Locale/locales.dart';
import 'package:shopcart/Pages/Search/cart.dart';
import 'package:shopcart/Pages/Search/search_result.dart';

class Product {
  Product(this.image, this.productName, this.productType, this.price);
  String image;
  String? productName;
  String productType;
  String price;
}

class SellerInfo extends StatefulWidget {
  @override
  _SellerInfoState createState() => _SellerInfoState();
}

class _SellerInfoState extends State<SellerInfo> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Product> products = [
      Product("assets/ProductImages/item1.png", locale.summerWhiteTop,
          "Pajeroma", "\$30.0"),
      Product("assets/ProductImages/item2.png", locale.summerWhiteTop,
          "Pajeroma", "\$50.0"),
      Product("assets/ProductImages/item3.png", locale.summerWhiteTop,
          "Pajeroma", "\$29.0"),
      Product("assets/ProductImages/item4.png", locale.summerWhiteTop,
          "Pajeroma", "\$42.0"),
      Product("assets/ProductImages/item5.png", locale.summerWhiteTop,
          "Pajeroma", "\$40.0"),
      Product("assets/ProductImages/item6.png", locale.summerWhiteTop,
          "Pajeroma", "\$35.0"),
      Product("assets/ProductImages/item4.png", locale.summerWhiteTop,
          "Pajeroma", "\$42.0"),
      Product("assets/ProductImages/item5.png", locale.summerWhiteTop,
          "Pajeroma", "\$40.0"),
      Product("assets/ProductImages/item6.png", locale.summerWhiteTop,
          "Pajeroma", "\$35.0"),
    ];
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  FadedScaleAnimation(
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.75),
                              BlendMode.dstATop),
                          image: AssetImage('assets/seller profile.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 50,
                    start: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 40,
                    end: 10,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()));
                        },
                        icon: ImageIcon(AssetImage('assets/ic_cart.png'),
                            color: Colors.white)),
                  ),
                  Positioned.directional(
                    bottom: 20,
                    start: 20,
                    textDirection: TextDirection.ltr,
                    child: Text('Operum England',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 24,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: buildGridView(products),
              ),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
