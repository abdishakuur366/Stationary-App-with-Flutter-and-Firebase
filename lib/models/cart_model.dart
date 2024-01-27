import 'package:flutter/foundation.dart';
import 'cart_item.dart'; // Import your CartItem model
import 'product.dart'; // Import your Product model

class CartModel with ChangeNotifier {
  final List<CartItem> _items = [];

  // A getter to provide read-only access to cart items
  List<CartItem> get items => List.unmodifiable(_items);

  // Adds a product to the cart
  void addProduct(Product product) {
    // Check if the product is already in the cart
    int index = _items.indexWhere((item) => item.product.name == product.name);

    if (index != -1) {
      // If the product is already in the cart, just increase its quantity
      _items[index].incrementQuantity();
    } else {
      // If not in the cart, add a new CartItem
      _items.add(CartItem(product: product));
    }

    // Notify all listeners of the change
    notifyListeners();
  }

  // Remove a product from the cart
  void removeProduct(Product product) {
    _items.removeWhere((item) => item.product.name == product.name);
    notifyListeners();
  }

  // Increment the quantity of a specific product in the cart
  void incrementQuantity(Product product) {
    int index = _items.indexWhere((item) => item.product.name == product.name);
    if (index != -1) {
      _items[index].incrementQuantity();
      notifyListeners();
    }
  }

  // Decrement the quantity of a specific product in the cart
  void decrementQuantity(Product product) {
    int index = _items.indexWhere((item) => item.product.name == product.name);
    if (index != -1) {
      _items[index].decrementQuantity();
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  // Calculate the total price of all items in the cart
  double get totalPrice =>
      _items.fold(0, (total, current) => total + current.totalPrice);
}
