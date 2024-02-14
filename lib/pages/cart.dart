import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/order/order_data.dart';
import 'package:flutter_shop/provider/order_provider.dart';
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
    final orderProvider = Provider.of<OrderProvider>(context);

    double total = 0;
    if (shoppingCartProvider.products.isNotEmpty) {
      total = shoppingCartProvider.products.entries
          .map((product) => product.value * product.key.price)
          .reduce((value, element) => value + element);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Shopping char")),
      body: ListView(children: [
        ListTile(
          title: Text("Total $total\$"),
          trailing: IconButton(
            icon: const Icon(Icons.payment),
            onPressed: () {
              if (shoppingCartProvider.products.isNotEmpty) {
                setState(() {
                  orderProvider.order(OrderData(shoppingCartProvider.products));
                  shoppingCartProvider.clear();
                });
              }
            },
          ),
        ),
        for (var product in shoppingCartProvider.products.entries)
          Dismissible(
            key: Key(product.key.name),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                shoppingCartProvider.products.remove(product.key);
              });
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: ListTile(
              leading: SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(product.key.imagePath),
                    Text("${product.key.price}\$"),
                  ],
                ),
              ),
              title: Column(
                children: [
                  Text(product.key.name),
                  Text("${product.key.price * product.value}\$"),
                ],
              ),
              trailing: Text("${product.value}"),
            ),
          )
      ]),
    );
  }
}
