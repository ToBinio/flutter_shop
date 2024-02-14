import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/product/product_data.dart';

class Product extends StatelessWidget {
  final ProductData product;

  const Product({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        children: [
          Center(child: Image.network(product.imagePath)),
          Center(child: Text(product.description)),
          Center(child: Text("price ${product.price}"))
        ],
      ),
    );
  }
}
