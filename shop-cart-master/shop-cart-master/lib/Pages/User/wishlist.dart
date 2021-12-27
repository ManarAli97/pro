import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shopcart/Components/drawer.dart';
import 'package:shopcart/Locale/locales.dart';
import 'package:shopcart/Pages/Search/search_result.dart';

class Product {
  Product(this.image, this.productName, this.productType, this.price);
  String image;
  String? productName;
  String productType;
  String price;
}

class MyWishList extends StatefulWidget {
  @override
  _MyWishListState createState() => _MyWishListState();
}

class _MyWishListState extends State<MyWishList> {
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
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text(locale.myWishList!.toUpperCase()),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: buildGridView(products, favourites: true),
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
