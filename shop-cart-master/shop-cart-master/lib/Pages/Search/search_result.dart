import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopcart/Locale/locales.dart';
import 'package:shopcart/Pages/Other/category_products.dart';
import 'package:shopcart/Pages/Other/product_info.dart';
import 'package:http/http.dart' as http;

// class Product {
//   Product(this.image, this.productName, this.productType, this.price);
//   String image;
//   String? productName;
//   String productType;
//   String price;
// }
class Product {
  final String image;
  final String? productName;
  final String productType;
  final String price;

  Product(
      {required this.image,
      required this.productName,
      required this.productType,
      required this.price});
  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
        image: map['url'],
        productName: map['id'],
        productType: map['id'],
        price: map['title']);
  }
}

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<Product> products = [];
  Future getpost() async {
    Uri url = (Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var item in responsebody) {
        setState(() {
          products.add(Product.fromJson(item));
        });
      }
    }
    // ignore: avoid_print
    print(responsebody);
    return products;
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    // List<Product> products = [
    //   Product("assets/ProductImages/item1.png", locale.summerWhiteTop,
    //       "Pajeroma", "\$30.0"),
    //   Product("assets/ProductImages/item2.png", locale.summerWhiteTop,
    //       "Pajeroma", "\$50.0"),
    //   Product("assets/ProductImages/item3.png", locale.summerWhiteTop,
    //       "Pajeroma", "\$29.0"),
    //   Product("assets/ProductImages/item4.png", locale.summerWhiteTop,
    //       "Pajeroma", "\$42.0"),
    //   Product("assets/ProductImages/item5.png", locale.summerWhiteTop,
    //       "Pajeroma", "\$40.0"),
    //   Product("assets/ProductImages/item6.png", locale.summerWhiteTop,
    //       "Pajeroma", "\$35.0"),
    //   Product("assets/ProductImages/item4.png", locale.summerWhiteTop,
    //       "Pajeroma", "\$42.0"),
    //   Product("assets/ProductImages/item5.png", locale.summerWhiteTop,
    //       "Pajeroma", "\$40.0"),
    //   Product("assets/ProductImages/item6.png", locale.summerWhiteTop,
    //       "Pajeroma", "\$35.0"),
    // ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextFormField(
          initialValue: ' ' + locale.tshirt!,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: Colors.grey[400],
              ),
              prefixIcon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey[400],
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1))),
        ),
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryProduct(locale.resultsFound)));
                },
                child: Text(
                  '124 ' + locale.resultsFound!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.grey[400], fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              buildGridView(products),
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

GridView buildGridView(List listName, {bool favourites = false}) {
  return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listName.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      itemBuilder: (context, index) {
        return buildProductCard(
            context,
            listName[index].image,
            listName[index].productName,
            listName[index].productType,
            listName[index].price,
            favourites: favourites);
      });
}

Widget buildProductCard(
    BuildContext context, String image, String name, String type, String price,
    {bool favourites = false}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductInfo()));
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              FadedScaleAnimation(
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.fill)),
                  //child: Image.asset(image, scale: 2,)
                ),
              ),
              favourites
                  ? Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
        Text(type, style: TextStyle(color: Colors.grey[500], fontSize: 10)),
        SizedBox(height: 4),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              buildRating(context),
            ],
          ),
        ),
      ],
    ),
  );
}

Container buildRating(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 1.5, bottom: 1.5, left: 4, right: 3),
    //width: 30,
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Text(
          "4.2",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.button!.copyWith(fontSize: 10),
        ),
        SizedBox(
          width: 1,
        ),
        Icon(
          Icons.star,
          size: 10,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ],
    ),
  );
}
