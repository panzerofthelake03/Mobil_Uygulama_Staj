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
    // Parse specs: can be a nested Map or flat fields
    final specsMap = <String, String>{};
    if (json['specs'] is Map) {
      (json['specs'] as Map).forEach((k, v) {
        if (v != null) specsMap[_capitalize(k.toString())] = v.toString();
      });
    } else {
      if (json['size'] != null) specsMap['Size'] = json['size'].toString();
      if (json['audio'] != null) specsMap['Audio'] = json['audio'].toString();
      if (json['color'] != null) specsMap['Color'] = json['color'].toString();
    }

    // Parse price: handles "$999", "1,299", 999 (num)
    double parsedPrice = 0.0;
    final rawPrice = json['price'];
    if (rawPrice is num) {
      parsedPrice = rawPrice.toDouble();
    } else if (rawPrice != null) {
      final cleaned = rawPrice.toString().replaceAll(RegExp(r'[^\d.]'), '');
      parsedPrice = double.tryParse(cleaned) ?? 0.0;
    }

    return Product(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      name: (json['name'] ?? json['title'] ?? '').toString(),
      category: (json['category'] ?? json['tagline'] ?? '').toString(),
      price: parsedPrice,
      description: (json['description'] ?? '').toString(),
      image: (json['image'] ?? json['thumbnail'] ?? '').toString(),
      specs: specsMap,
    );
  }

  static String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

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
