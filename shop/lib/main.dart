import 'package:flutter/material.dart';
import 'package:shop/screens/product_detail_page.dart';
import 'package:shop/screens/products_overview_page.dart';
import 'package:shop/utilities/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductsOverviewPage(),
      routes: {
        AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage(),
      },
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
