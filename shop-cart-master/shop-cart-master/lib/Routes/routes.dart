import 'package:flutter/material.dart';
//import 'package:shopcart/Pages/Checkout/ConfirmOrder.dart';
import 'package:shopcart/Pages/Other/home_page.dart';

class PageRoutes {
  static const String homePage = 'home_page';
  //static const String confirmOrder = 'confirm_order';

  Map<String, WidgetBuilder> routes() {
    return {
      homePage: (context) => HomePage(),
      //confirmOrder: (context) => ConfirmOrderPage(),
    };
  }
}
