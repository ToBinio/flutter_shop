import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/layout/layout.dart';
import 'package:flutter_shop/pages/product_edit.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Layout(
      title: "Prodcuts",
      child: ListView(children: [
        for (var (index, product) in productProvider.products.indexed)
          ListTile(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductEdit(index),
                ),
              )
            },
            title: Text(product.name),
            trailing: IconButton(
              icon: const Icon(Icons.delete_forever_outlined),
              onPressed: () {
                productProvider.delete(product);
              },
            ),
          )
      ]),
    );
  }
}
