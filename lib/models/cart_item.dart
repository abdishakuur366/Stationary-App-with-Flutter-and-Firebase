import 'package:flutter/foundation.dart';
import 'product.dart'; // Ensure this points to your Product model

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  // Method to calculate the total price for this cart item
  double get totalPrice => product.price * quantity;

  // Method to increment the quantity of the product
  void incrementQuantity() {
    quantity++;
  }

  // Method to decrement the quantity of the product
  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
