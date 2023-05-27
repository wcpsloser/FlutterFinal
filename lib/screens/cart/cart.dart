import 'package:flutter/material.dart';
import 'package:store_app/database/app_database.dart';
import 'package:store_app/models/user.dart';

import 'widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  final User user;

  const CartScreen({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Back to Home screen
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: AppDatabase.getUserCart(user.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'Your cart is empty.',
                  style: TextStyle(fontSize: 20.0),
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return CartItemCard(
                        order: snapshot.data![index],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Implement checkout functionality here
                        // You can add your own logic for processing the checkout.
                        await AppDatabase.checkout(snapshot.data!)
                            .then((_) => Navigator.pop(context));
                      },
                      child: const Text('Checkout'),
                    ),
                  ),
                )
              ],
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
