import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/product.dart';
import 'package:flutter_shop/pages/cart.dart';
import 'package:flutter_shop/pages/orders.dart';
import 'package:flutter_shop/pages/product_edit.dart';
import 'package:flutter_shop/pages/products.dart';
import 'package:flutter_shop/pages/shop.dart';
import 'package:flutter_shop/provider/order_provider.dart';
import 'package:flutter_shop/provider/product_provider.dart';
import 'package:flutter_shop/provider/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShoppingCartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/shop",
        routes: {
          "/shop": (context) => const Shop(),
          "/shop/cart": (context) => const Cart(),
          "/products": (context) => const Products(),
          "/products/edit": (context) => const ProductEdit(),
          "/orders": (context) => const Orders(),
        },
      ),
    );
  }
}
