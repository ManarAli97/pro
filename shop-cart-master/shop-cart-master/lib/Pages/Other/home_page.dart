import 'dart:io';
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shopcart/Auth/checkout_navigator.dart';
import 'package:shopcart/Components/drawer.dart';
import 'package:shopcart/Locale/locales.dart';
import 'package:shopcart/Pages/Search/search_history.dart';
import 'package:shopcart/Pages/Search/search_result.dart';
import 'package:shopcart/Pages/Other/category_products.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class Category {
  Category(this.image, this.name);
  String image;
  String? name;
}

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
  //       productName: map['id'].toString(),
  //       productType: map['id'].toString(),
  //       price: map['title']);
  // }
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredBanner?.dispose();
  }

  var _current = 0;
  @override
  Widget build(BuildContext context) {
    // final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    //     ? 'darkTheme'
    //     : 'lightTheme';
    var locale = AppLocalizations.of(context)!;
    final List<Category> categories = [
      Category('assets/CategoryImages/Jackets.png', locale.fashion),
      Category('assets/CategoryImages/Phones.png', locale.phones),
      Category('assets/CategoryImages/Furniture.png', locale.furniture),
      Category('assets/CategoryImages/Electronics.png', locale.beauty),
    ];
    List<String> carouselImages = [
      'assets/HomeBanner/HomeBanner.png',
      'assets/HomeBanner/Banner1.png',
      'assets/HomeBanner/Banner2.png',
      'assets/HomeBanner/Banner3.png',
    ];
    final List<Product> products = [
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
    ];
    final List<Product> products2 = [
      Product("assets/ProductImages/item6.png", locale.summerWhiteTop,
          "Pajeroma", "\$30.0"),
      Product("assets/ProductImages/item5.png", locale.summerWhiteTop,
          "Pajeroma", "\$50.0"),
      Product("assets/ProductImages/item4.png", locale.summerWhiteTop,
          "Pajeroma", "\$29.0"),
      Product("assets/ProductImages/item3.png", locale.summerWhiteTop,
          "Pajeroma", "\$42.0"),
      Product("assets/ProductImages/item2.png", locale.summerWhiteTop,
          "Pajeroma", "\$40.0"),
      Product("assets/ProductImages/item1.png", locale.summerWhiteTop,
          "Pajeroma", "\$35.0"),
    ];
    return Builder(
      builder: (BuildContext context) {
        if (!_loadingAnchoredBanner) {
          _loadingAnchoredBanner = true;
          _createAnchoredBanner(context);
        }
        return Stack(
          children: [
            Column(
              children: [
                Image.asset('assets/header1.jpg'),
                Expanded(child: Container(color: Colors.white)),
              ],
            ),
            Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.transparent,
              drawer: buildDrawer(context),
              body: SafeArea(
                child: Stack(
                  children: [
                    SizedBox(height: 12.0),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: AppBar(
                            leading: IconButton(
                              icon: Icon(
                                Icons.align_horizontal_left,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                scaffoldKey.currentState!.openDrawer();
                              },
                            ),
                            actions: [
                              IconButton(
                                icon: Icon(
                                  Icons.card_travel,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CheckOutNavigator()));
                                },
                              ),
                            ],
                            title: TextFormField(
                              readOnly: true,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchHistory()));
                              },
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.black, fontSize: 18),
                              decoration: InputDecoration(
                                  hintText: locale.searchOnShopCart,
                                  hintStyle:
                                      Theme.of(context).textTheme.subtitle2,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                        ),
                        Container(
                          height: 96,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                return buildCategoryRow(
                                    index, context, categories);
                              }),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 196),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          SizedBox(height: 16.0),
                          Stack(
                            children: [
                              CarouselSlider(
                                items: carouselImages.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                            child: FadedScaleAnimation(
                                                Image.asset(i))),
                                      );
                                    },
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                    autoPlay: true,
                                    viewportFraction: 1.0,
                                    enlargeCenterPage: false,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _current = index;
                                      });
                                    }),
                              ),
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                start: 20.0,
                                bottom: 0.0,
                                child: Row(
                                  children: carouselImages.map((i) {
                                    int index = carouselImages.indexOf(i);
                                    return Container(
                                      width: 12.0,
                                      height: 3.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: _current == index
                                            ? Colors.white /*.withOpacity(0.9)*/
                                            : Colors.white.withOpacity(0.5),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          if (_anchoredBanner != null)
                            Container(
                              width: _anchoredBanner!.size.width.toDouble(),
                              height: _anchoredBanner!.size.height.toDouble(),
                              child: AdWidget(ad: _anchoredBanner!),
                            ),
                          SizedBox(
                            height: 16,
                          ),
                          buildCompleteVerticalList(
                              locale, context, products, locale.newlyLaunched!),
                          buildCompleteVerticalList(locale, context, products,
                              locale.featuredProducts!),
                          buildCompleteVerticalList(locale, context, products2,
                              locale.discountedItems!),
                          buildCompleteVerticalList(
                              locale, context, products, locale.topRated!),
                          buildCompleteVerticalList(locale, context, products2,
                              locale.newlyLaunched!),
                          buildCompleteVerticalList(locale, context, products2,
                              locale.featuredProducts!),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Column buildCompleteVerticalList(AppLocalizations locale,
      BuildContext context, List<Product> products, String heading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(heading,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        buildList(products),
      ],
    );
  }
}

Container buildList(List<Product> products) {
  return Container(
    height: 240,
    child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: FadedScaleAnimation(
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                child: buildProductCard(
                    context,
                    products[index].image,
                    products[index].productName!,
                    products[index].productType,
                    products[index].price),
              ),
            ),
          );
        }),
  );
}

GestureDetector buildCategoryRow(
    int index, BuildContext context, List categories) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryProduct(categories[index].name)));
    },
    child: FadedScaleAnimation(
      Container(
        margin: EdgeInsets.only(left: 16),
        padding: EdgeInsets.all(10),
        width: 96,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage(categories[index].image), fit: BoxFit.fill)),
        child: Text(
          categories[index].name,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 11),
        ),
      ),
    ),
  );
}
