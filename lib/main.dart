import 'package:e_com_exam/pages/screens/cart_page/cart_page.dart';
import 'package:e_com_exam/pages/screens/category_page/category_page.dart';
import 'package:e_com_exam/pages/screens/detail_page/detail_page.dart';
import 'package:e_com_exam/pages/screens/home_page/home_page.dart';
import 'package:e_com_exam/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const E_comApp(),
  );
}

class E_comApp extends StatelessWidget {
  const E_comApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.homepage: (context) => const HomePage(),
        Routes.detailpage: (context) => const DetailPage(),
        Routes.cartpage: (context) => const CartPage(),
        Routes.categorypage: (context) => const CategoryPage(),
      },
    );
  }
}
