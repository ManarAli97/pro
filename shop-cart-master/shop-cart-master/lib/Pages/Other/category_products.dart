//import 'dart:convert';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shopcart/Locale/locales.dart';
import 'package:shopcart/Pages/Search/cart.dart';
import 'package:shopcart/Pages/Search/search_result.dart';
import 'package:shopcart/Pages/User/wishlist.dart';
//import 'package:http/http.dart' as http;

class Product {
  final String image;
  final String? productName;
  final String productType;
  final String price;
  Product(this.image, this.productName, this.productType, this.price);
  // Product(
  //     {required this.image,
  //     required this.productName,
  //     required this.productType,
  //     required this.price});
  // factory Product.fromJson(Map<String, dynamic> map) {
  //   return Product(
  //       image: map['url'],
  //       productName: map['title'],
  //       productType: map['title'],
  //       price: map['title']);
  // }
}

class CategoryProduct extends StatefulWidget {
  final String? title;

  CategoryProduct(this.title);

  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  // List<Product> products = [];
  // Future getpost() async {
  //   Uri url = (Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  //   var response = await http.get(url);
  //   var responsebody = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     for (var item in responsebody) {
  //       setState(() {
  //         products.add(Product.fromJson(item));
  //       });
  //     }
  //   }
  //   // ignore: avoid_print
  //   print(responsebody);
  //   return products;
  // }

  // @override
  // void initState() {
  //   getpost();
  //   super.initState();
  // }

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
      appBar: AppBar(
        title: Text(
          widget.title!,
          style: TextStyle(color: Theme.of(context).backgroundColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyWishList()));
            },
            icon: Icon(Icons.favorite),
            color: Colors.black,
          ),
          IconButton(
            icon: ImageIcon(AssetImage('assets/ic_cart.png')),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
        ],
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: buildGridView(products),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
