class Product {
  final String id;
  final String name;
  final List<String> images;
  final String price;
  final Category category;
  final int quantity;

  Product({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    required this.category,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    print("-----------");
    print(json);
    List<dynamic> jsonImages = json['images'] ?? [];
    List<String> images = List<String>.from(jsonImages.map((image) => image.toString()));
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      images: images,
      price: json['price'] ?? '',
      category: Category.fromJson(json['category'] ?? {}),
      quantity: json['quantity'] ?? 0,
    );
  }
}

class Category {
  final String id;
  final String name;
  final dynamic parent;

  Category({
    required this.id,
    required this.name,
    required this.parent,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      parent: json['parent'] ?? null,
    );
  }
}
