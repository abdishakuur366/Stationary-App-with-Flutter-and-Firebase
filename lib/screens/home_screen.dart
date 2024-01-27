import 'package:flutter/material.dart';
import 'package:stationary_application/screens/ProductDetailScreen.dart';
import '../models/product.dart';
import '../data/product_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          // Segmented control for switching views
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 50, 8.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildSegmentedControl(),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.fromLTRB(8, 50, 8, 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: products
                  .length, // Use the number of products for the item count
              itemBuilder: (context, index) {
                var product =
                    products[index]; // Get the product for the current index

                return Card(
                  color: Colors.black45,
                  elevation: 4.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          // Wrap the image with InkWell
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailScreen(product: product),
                              ),
                            );
                          },
                          child: Image.asset(
                            product.imageUrl, // Use the product's image URL
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.name,
                              style: TextStyle(color: Colors.white),
                            ), // Use the product's name
                            Text(
                              product.description,
                              style: TextStyle(color: Colors.white),
                            ), // Use the product's description
                            Text(
                              '\$${product.price}',
                              style: TextStyle(color: Colors.white),
                            ), // Use the product's price
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            products[index].toggleFavoriteStatus();
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        child: Text(
                          product.isFavorite
                              ? 'Remove from favorites'
                              : 'Add to favorites',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Container(
      child: ToggleButtons(
        borderColor: Colors.grey,
        fillColor: Colors.blue,
        borderWidth: 2,
        selectedBorderColor: Colors.blue,
        selectedColor: Colors.white,
        borderRadius: BorderRadius.circular(0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Products',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < 2; i++) {
              if (i == index) {
                // Active state of button
              } else {
                // Inactive state
              }
            }
          });
        },
        isSelected: [true, false], // The state of buttons
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

void main() => runApp(MaterialApp(home: HomeScreen()));
