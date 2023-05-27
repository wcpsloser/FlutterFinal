import 'package:flutter/material.dart';
import 'package:store_app/database/app_database.dart';
import 'package:store_app/models/order.dart';
import 'package:store_app/models/user.dart';
import 'package:store_app/screens/cart/cart.dart';

import 'widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        user: user,
                      ),
                    ),
                  );
                } else if (value == 'logout') {
                  // Perform logout functionality here
                  // You can add your own logic for logging out the user.
                  Navigator.pop(context);
                }
              },
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 8.0),

                  // Show Username Text
                  Text(
                    user.fullname,
                    style: const TextStyle(fontSize: 16.0),
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
      body: FutureBuilder(
        future: AppDatabase.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: snapshot.data![index],
                  onAddToCart: () async {
                    final order = Order(
                      userId: user.id,
                      product: snapshot.data![index],
                      quantity: 1,
                      status: 'unpaid',
                    );
                    await AppDatabase.createOrder(order);
                  },
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
