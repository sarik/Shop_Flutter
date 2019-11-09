import 'package:flutter/foundation.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem(this.name, this.quantity, this.price);
}

class Cart with ChangeNotifier {
  Map<String, CartItem> cartItems = {};

  Map<String, CartItem> get _cartItems {
    return {...cartItems};
  }

  int len() {
    return cartItems.length;
  }

  double get getTotal {
    double total = 0.0;

    cartItems.forEach((key, val) => total = total + val.price * val.quantity);

    return total;
  }

  void addToCart(String productID, double price, String name) {
    if (!cartItems.containsKey(productID)) {
      cartItems.putIfAbsent(productID, () => CartItem(name, 1, price));
    } else {
      cartItems.update(
          productID,
          (existingCartItem) =>
              CartItem(productID, existingCartItem.quantity + 1, price));
    }

    notifyListeners();
  }

  void removeItem(productId) {
    cartItems.remove(productId);
    notifyListeners();
  }

  void changeQuantity(productId, action) {
    CartItem curr = cartItems[productId];
    if (action == "add")
      curr.quantity += 1;
    else {
      curr.quantity -= 1;
      if (curr.quantity == 0) cartItems.remove(productId);
    }

    notifyListeners();
  }
}
