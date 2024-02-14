import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../product/product_data.dart';

class ShoppingCartProvider extends ChangeNotifier {
  HashMap<ProductData, int> _products = HashMap();

  ShoppingCartProvider();

  void buy(ProductData product) {
    _products.putIfAbsent(product, () => 0);

    _products[product] = _products[product]! + 1;

    notifyListeners();
  }

  void undo(ProductData product) {
    _products.putIfAbsent(product, () => 0);

    _products[product] = _products[product]! - 1;

    if (products[product]! <= 0) {
      products.remove(product);
    }

    notifyListeners();
  }

  void clear() {
    _products = HashMap();

    notifyListeners();
  }

  HashMap<ProductData, int> get products => _products;
}
