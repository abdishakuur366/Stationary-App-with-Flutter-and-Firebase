import 'package:flutter/material.dart';
import 'package:stationary_application/data/product_data.dart';
import 'package:stationary_application/screens/cart_screen.dart';
import 'favorites_screen.dart'; // Import FavoritesScreen
import '../models/product.dart'; // Import Product model
import 'home_screen.dart';
// Import other necessary screens or models

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Product> getFavoriteProducts() {
    return products.where((product) => product.isFavorite).toList();
  } // Your list of all products

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          // Replace these with your actual screens
          HomeScreen(), // Your home screen
          CartScreen(),
          FavoritesScreen(favoriteProducts: _getFavoriteProducts()),
          // Favorites screen
          // Add other screens if you have more tabs
          CartScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          // Add other tabs if necessary
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  List<Product> _getFavoriteProducts() {
    return products.where((product) => product.isFavorite).toList();
  }
}
