import 'package:flutter/foundation.dart';

class CartItem {
  final String name;

  int quantity;

  CartItem(this.name, this.quantity);
}

class Cart with ChangeNotifier {
  Map<String, CartItem> cartItems = {};

  Map<String, CartItem> get _cartItems {
    return {...cartItems};
  }

  int len() {
    return cartItems.length;
  }

  void addToCart(String productID, String name) {
    cartItems.putIfAbsent(productID, () => CartItem(name, 0));
    notifyListeners();
  }
}
