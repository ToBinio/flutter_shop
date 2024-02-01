import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/product/productData.dart';

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
      body: Column(
        children: [
          Image.network(product.imagePath),
          Text("price ${product.price}")
        ],
      ),
    );
  }
}
