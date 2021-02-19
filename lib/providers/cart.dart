import 'package:flutter/material.dart';

class CartItem {
  final double price;
  final int quantity;
  final String cartItemId;
  final String dishName;

  CartItem({
    @required this.price,
    @required this.quantity,
    @required this.cartItemId,
    @required this.dishName,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get totalCartItems {
    //adds all quantities
    var total = 0;

    _items.forEach((key, value) {
      total += value.quantity;
    });

    return total;
  }

  double get totalCartPrice {
    var total = 0.0;
    _items.forEach((key, value) {
      total += (value.quantity * value.price);
    });
    return total;
  }

  void addToCart(String dishId, String dishName, double prodPrice) {
    if (_items.containsKey(dishId)) {
      _items.update(
        dishId,
        (existingCartItem) => CartItem(
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
          cartItemId: existingCartItem.cartItemId,
          dishName: existingCartItem.dishName,
        ),
      );
    } else {
      _items.putIfAbsent(
        dishId,
        () => CartItem(
          price: prodPrice,
          quantity: 1,
          cartItemId: DateTime.now().toString(),
          dishName: dishName,
        ),
      );
    }

    notifyListeners();
  }

  void addquantity(String productId) {
    _items.update(
      productId,
      (existingCartItem) => CartItem(
        price: existingCartItem.price,
        quantity: existingCartItem.quantity + 1,
        cartItemId: existingCartItem.cartItemId,
        dishName: existingCartItem.dishName,
      ),
    );
    notifyListeners();
  }

  void deletefromcart(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void undosnackbaraction(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    } else if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
          cartItemId: existingCartItem.cartItemId,
          dishName: existingCartItem.dishName,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
