import 'package:flutter/material.dart';
import 'package:stationary_application/screens/ProductDetailScreen.dart';
import '../models/product.dart'; // Import your Product model

class FavoritesScreen extends StatelessWidget {
  final List<Product> favoriteProducts;

  FavoritesScreen({required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favoriteProducts.isEmpty
          ? Center(child: Text('No favorites added yet'))
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      product.imageUrl, // Display product image
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                              product: favoriteProducts[index]),
                        ),
                      );
                    },
                    title: Text(favoriteProducts[index].name), // Product name
                    subtitle: Text(product.description), // Product description
                  ),
                );
              },
            ),
    );
  }
}
