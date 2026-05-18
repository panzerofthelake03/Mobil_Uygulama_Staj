import 'package:flutter/foundation.dart';
import '../models/product.dart';

class CartService {
  CartService._();
  static final CartService instance = CartService._();

  final ValueNotifier<List<Product>> _notifier =
      ValueNotifier<List<Product>>([]);

  ValueListenable<List<Product>> get listenable => _notifier;
  List<Product> get items => _notifier.value;
  int get count => _notifier.value.length;
  double get total =>
      _notifier.value.fold(0.0, (sum, p) => sum + p.price);

  void add(Product p) {
    if (!items.any((e) => e.id == p.id)) {
      _notifier.value = [...items, p];
    }
  }

  void remove(Product p) {
    _notifier.value = items.where((e) => e.id != p.id).toList();
  }

  bool contains(Product p) => items.any((e) => e.id == p.id);
}
