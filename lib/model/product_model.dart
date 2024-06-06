class Product {
  final int? id;
  final String imagePath;
  final String name;
  final String price;

  Product(
      {this.id,
      required this.imagePath,
      required this.name,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      imagePath: map['imagePath'],
      name: map['name'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'price': price,
    };
  }
}
