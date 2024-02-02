import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/layout/layout.dart';
import 'package:flutter_shop/pages/product.dart';
import 'package:flutter_shop/provider/product_provider.dart';
import 'package:flutter_shop/provider/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  bool showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);

    return Layout(
      title: 'Shop',
      actions: [
        PopupMenuButton(
          onSelected: (value) {
            setState(() {
              showOnlyFavorite = value;
            });
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem<bool>(
                  value: true, child: Text("only favorites")),
              const PopupMenuItem<bool>(value: false, child: Text("all"))
            ];
          },
        ),
        IconButton(
            onPressed: () => {Navigator.pushNamed(context, "/shop/cart")},
            icon: const Icon(Icons.shopping_cart))
      ],
      child: GridView.count(crossAxisCount: 2, children: [
        for (var product in productProvider.products
            .where((product) => !showOnlyFavorite || product.isFavorite))
          Container(
            margin: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Product(product: product),
                  ),
                );
              },
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
                            onPressed: () {
                              setState(() {
                                product.toggleIsFavorite();
                              });
                            },
                            icon: Icon(
                              product.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.white,
                            )),
                        Text(product.name,
                            style: const TextStyle(color: Colors.white)),
                        IconButton(
                            onPressed: () {
                              shoppingCartProvider.buy(product);
                            },
                            icon: const Icon(Icons.shopping_bag_outlined,
                                color: Colors.white)),
                      ]),
                ),
                child: Image.network(product.imagePath),
              ),
            ),
          )
      ]),
    );
  }
}
