import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shopcart/Locale/locales.dart';
import 'package:shopcart/Pages/Other/home_page.dart';
import 'package:shopcart/Pages/Search/search_result.dart' as search;
import 'package:http/http.dart' as http;

class SearchHistory extends StatefulWidget {
  @override
  _SearchHistoryState createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  List order = [];
  Future geet() async {
    var url = "https://jsonplaceholder.typicode.com/posts" as Uri;
    var respose = await http.get(url);
    var resposebody = jsonDecode(respose.body);
    setState(() {
      order.addAll(resposebody);
    });
  }

  @override
  void initState() {
    geet();
    super.initState();
  }

  final List<String> _searchList = [];
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<Category> categories = [
      Category('assets/CategoryImages/Jackets.png', locale.fashion),
      Category('assets/CategoryImages/Phones.png', locale.phones),
      Category('assets/CategoryImages/Furniture.png', locale.furniture),
      Category('assets/CategoryImages/Electronics.png', locale.beauty),
    ];
    // final List<Product> products = [
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
        title: TextField(
          onSubmitted: (s) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => search.SearchResult()));
            setState(() {
              _searchList.add(s);
            });
          },
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
              hintText: '  ' + locale.searchOnShopCart!,
              hintStyle: Theme.of(context).textTheme.subtitle2,
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey[400],
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => search.SearchResult())),
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
        ListView(
          children: [
            _searchList.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        child: Text(
                          locale.recentlySearched!,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        height: 144.0,
                        child: ListView.builder(
                          itemCount: _searchList.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.0,
                                    horizontal: 16.0,
                                  ),
                                  child: Icon(Icons.youtube_searched_for,
                                      color: Theme.of(context).backgroundColor),
                                ),
                                Text(
                                  _searchList[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
              child: Text(
                locale.chooseCategory!,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 96,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return buildCategoryRow(index, context, categories);
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(locale.featuredProducts!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 18)),
            ),
            buildList(order[1]),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
