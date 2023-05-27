import 'package:flutter/material.dart';
import 'package:store_app/models/order.dart';

class CartItemCard extends StatelessWidget {
  final Order order;

  const CartItemCard({
    required this.order,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Show Product name
            Text(
              order.product.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),

            // Show description
            Text(order.product.description),
            const SizedBox(height: 8.0),

            // Show price
            Text(
              'Price: \$${order.product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),

            // Show quantity
            Text(
              'Quantity: ${order.quantity}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
