import 'package:flutter/cupertino.dart';

import '../product/product_data.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductData> _products = [];

  ProductProvider() {
    add(ProductData(
        "Ente",
        "https://media.istockphoto.com/id/1346566570/de/foto/gummienten-spielzeug-isoliert-%C3%BCber-wei%C3%9Fem-hintergrund.jpg?s=612x612&w=0&k=20&c=FTMku-eOjaF3uiabdvRGQufQgK4yRsXmNrpr3fnWlL4=",
        15));
    add(ProductData(
        "Stein",
        "https://media.istockphoto.com/id/1346566570/de/foto/gummienten-spielzeug-isoliert-%C3%BCber-wei%C3%9Fem-hintergrund.jpg?s=612x612&w=0&k=20&c=FTMku-eOjaF3uiabdvRGQufQgK4yRsXmNrpr3fnWlL4=",
        20));
    add(ProductData("Götz", "http://store.tobinio.at/file/IMG_4029.PNG", 500));
    add(ProductData(
        "Fabian", "http://store.tobinio.at/file/IMG_4133.PNG", 150.99));
  }

  void add(ProductData product) {
    _products.add(product);

    notifyListeners();
  }



  List<ProductData> get products => _products;
}
