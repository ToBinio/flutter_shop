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
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductEdit(null,"add Product"),
              ),
            );
          },
        )
      ],
      child: ListView(children: [
        for (var product in productProvider.products)
          ListTile(
            leading: Image.network(product.imagePath),
            title: Text(product.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductEdit(product,"edit Product"),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_forever_outlined),
                  onPressed: () {
                    productProvider.delete(product);
                  },
                ),
              ],
            ),
          )
      ]),
    );
  }
}
