// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shopcart/Pages/Other/category_products.dart';

// class FetchApi {
//   Future<List<Product>> fetchproducts() async {
//     final response = await http.get(Uri.parse("assets/productapi.json"));
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       List<Product> listproduct = [];
//       for (var item in body) {
//         listproduct.add(Product.fromJson(item));
//       }
//       return listproduct;
//     }
//     //return "null";
//   }
// }
