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

    int itemsInShoppingCart = 0;
    if (shoppingCartProvider.products.isNotEmpty) {
      itemsInShoppingCart = shoppingCartProvider.products.entries
          .map((e) => e.value)
          .reduce((value, element) => value + element);
    }

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
        buildIconWithBadge(itemsInShoppingCart)
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
                              var snackBar = SnackBar(
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                        "added ${product.name} to the shopping cart"),
                                    TextButton(
                                        onPressed: () {
                                          shoppingCartProvider.undo(product);
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                        },
                                        child: const Text("undo"))
                                  ],
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

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

  Widget buildIconWithBadge(int badgeNumber) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, "/shop/cart");
          },
        ),
        Positioned(
          right: 5,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange, // Choose your desired color
            ),
            child: Text(
              badgeNumber.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
