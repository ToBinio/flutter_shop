import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../product/product_data.dart';

class OrderProvider extends ChangeNotifier {
  final List<HashMap<ProductData, int>> _orders = [];

  OrderProvider();

  void order(HashMap<ProductData, int> order) {
    _orders.add(order);
    notifyListeners();
  }

  List<HashMap<ProductData, int>> get orders => _orders;
}
