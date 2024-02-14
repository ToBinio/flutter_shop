import 'dart:collection';

import '../product/product_data.dart';

class OrderData {
  final HashMap<ProductData, int> _products;
  late DateTime _date;

  OrderData(this._products) {
    _date = DateTime.now();
  }

  DateTime get date => _date;

  HashMap<ProductData, int> get products => _products;
}
