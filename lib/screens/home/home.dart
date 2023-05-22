import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/screens/cart/cart.dart';

import 'widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = <Product>[
      Product(
        name: 'Product 1',
        description: 'Description for Product 1',
        price: 10.99,
        stock: 10,
      ),
      Product(
        name: 'Product 2',
        description: 'Description for Product 2',
        price: 19.99,
        stock: 10,
      ),
      Product(
        name: 'Product 3',
        description: 'Description for Product 3',
        price: 14.99,
        stock: 10,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false, // Remove back button
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                // Function for check that Cart or Logout Button is pressed
                if (value == 'cart') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                } else if (value == 'logout') {
                  // Perform logout functionality here
                  // You can add your own logic for logging out the user.
                  Navigator.pop(context);
                }
              },
              icon: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 8.0),

                  // Show Username Text
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              itemBuilder: (BuildContext context) => [
                // Cart Button
                const PopupMenuItem<String>(
                  value: 'cart',
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: 8.0),
                      Text('Cart'),
                    ],
                  ),
                ),

                // Logout Button
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 8.0),
                      Text('Logout'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            onAddToCart: () {
              // Implement add to cart functionality here
              // You can access the selected product using products[index]
              // and perform the necessary operations.
            },
          );
        },
      ),
    );
  }
}
