import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/product_provider.dart';
import 'package:provider/provider.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      drawer: Drawer(
        child: Column(children: [
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () => {},
              child: const Row(
                children: [
                  Icon(Icons.place),
                  Text(
                    "Shop",
                  )
                ],
              )),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () => {},
              child: const Row(
                children: [Icon(Icons.place), Text("Orders")],
              )),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () => {},
              child: const Row(
                children: [Icon(Icons.place), Text("Manage Products")],
              ))
        ]), // Populate the Drawer in the next step.
      ),
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Colors.yellow,
      ),
      body: GridView.count(crossAxisCount: 2, children: [
        for (var product in productProvider.products)
          Container(
            margin: const EdgeInsets.all(5),
            child: GridTile(
              footer: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.black87,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          )),
                      Text(product.name,
                          style: const TextStyle(color: Colors.white)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_bag_outlined,
                              color: Colors.white)),
                    ]),
              ),
              child: Image.network(product.imagePath),
            ),
          )
      ]),
    );
  }
}
