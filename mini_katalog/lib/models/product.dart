class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String image;
  final Map<String, String> specs;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
    this.specs = const {},
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final specsMap = <String, String>{};
    if (json['size'] != null) specsMap['Size'] = json['size'].toString();
    if (json['audio'] != null) specsMap['Audio'] = json['audio'].toString();
    if (json['color'] != null) specsMap['Color'] = json['color'].toString();
    if (json['weight'] != null) specsMap['Weight'] = json['weight'].toString();
    if (json['rating'] is Map) {
      specsMap['Rating'] = json['rating']['rate'].toString();
    }

    return Product(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      name: (json['name'] ?? json['title'] ?? '').toString(),
      category: (json['category'] ?? '').toString(),
      price: json['price'] is num
          ? (json['price'] as num).toDouble()
          : double.tryParse(json['price'].toString()) ?? 0.0,
      description: (json['description'] ?? '').toString(),
      image: (json['image'] ?? json['thumbnail'] ?? '').toString(),
      specs: specsMap,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'price': price,
        'description': description,
        'image': image,
        'specs': specs,
      };
}
