import 'package:flutter/material.dart';
import 'package:store_app/models/product.dart';

import 'widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> cartItems = [
      Product(
        name: 'Product 1',
        description: 'Description for Product 1',
        price: 10.99,
        stock: 1,
      ),
      Product(
        name: 'Product 2',
        description: 'Description for Product 2',
        price: 19.99,
        stock: 1,
      ),
      Product(
        name: 'Product 3',
        description: 'Description for Product 3',
        price: 14.99,
        stock: 1,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Builder(builder: (context) {
        if (cartItems.isNotEmpty) {
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return CartItemCard(
                product: cartItems[index],
              );
            },
          );
        }
        return const Center(
          child: Text(
            'Your cart is empty.',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Implement checkout functionality here
            // You can add your own logic for processing the checkout.
          },
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}
