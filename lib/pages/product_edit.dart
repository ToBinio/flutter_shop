import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class ProductEdit extends StatefulWidget {
  final int _productId;

  const ProductEdit(this._productId, {super.key});

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final product = productProvider.products[widget._productId];

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: ListView(
        children: [
          Image.network(product.imagePath),
          Text("current price: ${product.price}"),
          TextField(
            onSubmitted: (value) {
              setState(() {
                product.price = double.parse(value);
              });
            },
            keyboardType: TextInputType.number,
          ),
          Text("current name: ${product.name}"),
          TextField(
            onSubmitted: (value) {
              setState(() {
                product.name = value;
              });
            },
          ),
          Text("current img: ${product.imagePath}"),
          TextField(
            onSubmitted: (value) {
              setState(() {
                product.imagePath = value;
              });
            },
          )
        ],
      ),
    );
  }
}
