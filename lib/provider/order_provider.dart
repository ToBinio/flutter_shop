import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/order/order_data.dart';

import '../product/product_data.dart';

class OrderProvider extends ChangeNotifier {
  final List<OrderData> _orders = [];

  OrderProvider();

  void order(OrderData order) {
    _orders.add(order);
    notifyListeners();
  }

  List<OrderData> get orders => _orders;
}
