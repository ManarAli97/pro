import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopcart/Auth/checkout_navigator.dart';
import 'package:shopcart/Locale/locales.dart';

class Product {
  Product(this.img, this.name, this.category, this.price);
  String img;
  String? name;
  String category;
  String price;
//  int count;
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> count = [1, 1, 1];
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Product> items = [
      Product("assets/ProductImages/item1.png", locale.blackCottonTop,
          'Operum England', '\$32.00'),
      Product("assets/ProductImages/item4.png", locale.blackCottonTop,
          'Operum England', '\$44.00'),
      Product("assets/ProductImages/item7.png", locale.hairStraightner,
          'Operum England', '\$14.00'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.yourCart!),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  items[index].img,
                                  height: 95,
                                )),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  items[index].name!,
                                  style: Theme.of(context).textTheme.subtitle1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  items[index].category,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    buildIconButton(
                                        Icons.remove, index, items, count),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text('${count[index]}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    buildIconButton(
                                        Icons.add, index, items, count),
                                    SizedBox(
                                      width: 40,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(items[index].price,
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                      );
                    }),
                SizedBox(height: 248),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Container(
                  height: 235,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: locale.addPromocode,
                            fillColor: Colors.grey[100],
                            filled: true,
                            suffixIcon: MaterialButton(
                              onPressed: () {
//                            Scaffold.of(context).showSnackBar(new SnackBar(
//                                content: new Text('Promo Code Applied!')
//                            ));
                              },
                              child: Text(
                                locale.apply!,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xffffb910)),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      buildAmountRow(locale.cartTotal!, '\$ 90.0'),
                      buildAmountRow(locale.deliveryFee!, '\$ 8.0'),
                      buildAmountRow(locale.promoCode!, '-\$ 10.0'),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.popAndPushNamed(
                            context, CheckOutRoutes.selectAddress),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          color: Color(0xffffb910),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Text(
                                  locale.checkoutNow!,
                                  style: Theme.of(context).textTheme.button,
                                ),
                                Spacer(
                                  flex: 6,
                                ),
                                Text(locale.total!,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[100],
                                        fontWeight: FontWeight.w500)),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  '\$88.0',
                                  style: Theme.of(context).textTheme.button,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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

  Padding buildAmountRow(String text, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Spacer(),
          Text(
            price,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Container buildIconButton(IconData icon, int index, items, count) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.grey[400]!, width: 0)),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (icon == Icons.remove) {
              if (count[index] > 0) count[index]--;
            } else {
              count[index]++;
            }
          });
        },
        child: Icon(
          icon,
          color: Colors.grey[700],
          size: 16,
        ),
      ),
    );
  }
}
