import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'screens/cart_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MiniCatalogueApp());
}

class MiniCatalogueApp extends StatelessWidget {
  const MiniCatalogueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Catalogue',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.productDetail: (context) => const ProductDetailScreen(),
        AppRoutes.cart: (context) => const CartScreen(),
      },
    );
  }
}
