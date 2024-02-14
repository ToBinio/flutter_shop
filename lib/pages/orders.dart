import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/order/order_data.dart';
import 'package:flutter_shop/provider/order_provider.dart';
import 'package:provider/provider.dart';

import '../layout/layout.dart';
import '../product/product_data.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<OrderProvider>(context);

    return Layout(
        title: "Orders",
        child: ListView(
          children: [
            for (var order in productProvider.orders) displayOrder(order)
          ],
        ));
  }

  Widget displayOrder(OrderData order) {
    double total = order.products.entries
        .map((product) => product.value * product.key.price)
        .reduce((value, element) => value + element);

    return ExpansionTile(
      title: Text("Total: $total\$"),
      subtitle: Text(order.date.toString()),
      children: [
        for (var product in order.products.entries)
          ListTile(
            leading: Image.network(product.key.imagePath),
            title: Text("${product.key.name} x${product.value}"),
            trailing: Text("${product.value * product.key.price}\$"),
          )
      ],
    );
  }
}
