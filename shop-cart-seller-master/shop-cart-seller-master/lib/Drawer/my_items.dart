import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shopcart_seller/Components/drawer.dart';
import 'package:shopcart_seller/Components/grid_view.dart';
import 'package:shopcart_seller/Locale/locales.dart';
import 'package:shopcart_seller/Routes/routes.dart';

class Product {
  Product(
      this.image, this.productName, this.productType, this.price, this.enabled);
  String image;
  String? productName;
  String productType;
  String price;
  bool enabled;
}

class MyItemsPage extends StatefulWidget {
  @override
  _MyItemsPageState createState() => _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Product> products = [
      Product("assets/ProductImages/item1.png", locale.summerWhiteTop,
          "Pajeroma", "\$30.0", true),
      Product("assets/ProductImages/item2.png", locale.summerWhiteTop,
          "Pajeroma", "\$50.0", true),
      Product("assets/ProductImages/item3.png", locale.summerWhiteTop,
          "Pajeroma", "\$29.0", false),
      Product("assets/ProductImages/item4.png", locale.summerWhiteTop,
          "Pajeroma", "\$42.0", true),
      Product("assets/ProductImages/item5.png", locale.summerWhiteTop,
          "Pajeroma", "\$40.0", true),
      Product("assets/ProductImages/item6.png", locale.summerWhiteTop,
          "Pajeroma", "\$35.0", false),
      Product("assets/ProductImages/item4.png", locale.summerWhiteTop,
          "Pajeroma", "\$42.0", true),
      Product("assets/ProductImages/item5.png", locale.summerWhiteTop,
          "Pajeroma", "\$40.0", true),
      Product("assets/ProductImages/item6.png", locale.summerWhiteTop,
          "Pajeroma", "\$35.0", true),
    ];
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text(locale.myItems!.toUpperCase()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: FadedSlideAnimation(
        buildGridView(products),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Theme.of(context).scaffoldBackgroundColor,
          size: 32,
        ),
        onPressed: () {
          Navigator.pushNamed(context, PageRoutes.editItem);
        },
      ),
    );
  }
}
