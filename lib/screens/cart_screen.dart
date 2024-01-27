import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart'; // Import your CartModel

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        leading:
                            Image.asset(item.product.imageUrl), // Product image
                        title: Text(item.product.name), // Product name
                        subtitle: Text(
                            '\$${item.product.price.toStringAsFixed(2)}'), // Product price
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                cart.removeItem(item);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () =>
                                  cart.decrementQuantity(item.product),
                            ),
                            Text(item.quantity.toString()), // Quantity
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () =>
                                  cart.incrementQuantity(item.product),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:', style: TextStyle(fontSize: 20)),
                    Text('\$${cart.totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  var cart = Provider.of<CartModel>(context, listen: false);

                  // Check if the cart is empty
                  if (cart.items.isEmpty) {
                    // Show a different message if the cart is empty
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Checkout'),
                          content: Text('There is nothing to checkout'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Normal checkout process
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Checkout'),
                          content: Text('Payment logic goes here'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                                cart.clearCart(); // Clear the cart
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Checkout'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Button size
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
