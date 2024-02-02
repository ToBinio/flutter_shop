import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../product/productData.dart';

class ShoppingCartProvider extends ChangeNotifier {
  final HashMap<ProductData, int> _products = HashMap();

  ShoppingCartProvider();

  void buy(ProductData product) {
    _products.putIfAbsent(product, () => 0);

    _products[product] = _products[product]! + 1;

    notifyListeners();
  }

  HashMap<ProductData, int> get products => _products;
}
