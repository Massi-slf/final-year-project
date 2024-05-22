class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String category;
  final int quintity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.quintity,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price']),
      category: json['category']['name'],  // Assuming you want the category name
      quintity: json['quintity'] ?? 0,     // Default to 0 if quintity is missing
      description: json['description'] ?? 'No description',  // Default description
    );
  }
}
