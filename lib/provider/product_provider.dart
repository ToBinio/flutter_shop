import 'package:flutter/cupertino.dart';

import '../product/Product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [];

  ProductProvider() {
    add(Product("Ente",
        "https://media.istockphoto.com/id/1346566570/de/foto/gummienten-spielzeug-isoliert-%C3%BCber-wei%C3%9Fem-hintergrund.jpg?s=612x612&w=0&k=20&c=FTMku-eOjaF3uiabdvRGQufQgK4yRsXmNrpr3fnWlL4="));
    add(Product("Stein",
        "https://media.istockphoto.com/id/1346566570/de/foto/gummienten-spielzeug-isoliert-%C3%BCber-wei%C3%9Fem-hintergrund.jpg?s=612x612&w=0&k=20&c=FTMku-eOjaF3uiabdvRGQufQgK4yRsXmNrpr3fnWlL4="));
    add(Product("Buch",
        "https://media.istockphoto.com/id/1346566570/de/foto/gummienten-spielzeug-isoliert-%C3%BCber-wei%C3%9Fem-hintergrund.jpg?s=612x612&w=0&k=20&c=FTMku-eOjaF3uiabdvRGQufQgK4yRsXmNrpr3fnWlL4="));
    add(Product("phone",
        "https://www.electronic4you.at/media/catalog/product/cache/0/image/1500x/9df78eab33525d08d6e5fb8d27136e95/2/4/247178.jpg"));
  }

  void add(Product product) {
    _products.add(product);

    notifyListeners();
  }

  List<Product> get products => _products;
}
