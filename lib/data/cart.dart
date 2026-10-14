import 'package:flutter/foundation.dart';

import '../models/product.dart';

class Cart extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  int get count => _items.length;

  bool get isEmpty => _items.isEmpty;

  bool contains(Product product) {
    return _items.any((item) => item.id == product.id);
  }

  void add(Product product) {
    if (contains(product)) return;

    _items.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _items.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }
}

final Cart cart = Cart();
