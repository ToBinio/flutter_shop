import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/shopping_cart_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Shopping char")),
      body: ListView(children: [
        ListTile(title: Text("Total"),),
        for (var product in shoppingCartProvider.products.entries)
          ListTile(
            leading: Text("${product.key.price}\$"),
            title: Column(
              children: [
                Text(product.key.name),
                Text("${product.key.price * product.value}\$"),
              ],
            ),
            trailing: Text("${product.value}"),
          )
      ]),
    );
  }
}
