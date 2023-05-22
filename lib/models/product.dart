class Product {
  final String name;
  final String description;
  final double price;
  int stock;

  Product({
    required this.name,
    required this.description,
    required this.price,
    this.stock = 0,
  });
}
