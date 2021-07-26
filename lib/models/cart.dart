import 'package:flutter/foundation.dart';

import 'cartlog.dart';

class CartModel extends ChangeNotifier {
  CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catelog {
    return _catalog;
  }

  set catelog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Item> get items {
    return _itemIds.map((id) {
     return _catalog.getById(id);
    }).toList();
  }

  int get totalPrice {
    return items.fold(0, (total, current) => total + current.price);
  }

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
