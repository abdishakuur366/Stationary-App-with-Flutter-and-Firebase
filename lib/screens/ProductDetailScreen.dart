import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_model.dart'; // Import your CartModel
import '../models/cart_item.dart'; // Import your CartItem model// Ensure this import points to the location of your Product model

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Adjust the background color if needed
      appBar: AppBar(
        elevation: 0, // Removes the shadow from the app bar
        backgroundColor: Colors
            .white, // Matches the app bar background color to the scaffold background
        iconTheme: IconThemeData(
            color:
                Colors.black), // Changes the app bar back button color to black
        title: Text(
          'Detail Item', // You can use product.name if you want the product's name here
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16), // Add space at the top
          Center(
            child: Image.asset(
              product.imageUrl,
              width: MediaQuery.of(context).size.width *
                  0.8, // 80% of screen width
              height: MediaQuery.of(context).size.height *
                  0.3, // 30% of screen height
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Description',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  'Price',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double
                      .infinity, // Makes the button stretch to fill the width
                  child: ElevatedButton(
                    onPressed: () {
                      // Accessing the cart model
                      CartModel cart =
                          Provider.of<CartModel>(context, listen: false);

                      // Adding the product to the cart
                      cart.addProduct(product);

                      // Optionally, show a confirmation message
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('${product.name} added to cart'),
                        duration: Duration(seconds: 2),
                      ));
                    },
                    child: Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context)
                          .colorScheme
                          .secondary, // Button background color
                      onPrimary: Colors.white, // Button text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
