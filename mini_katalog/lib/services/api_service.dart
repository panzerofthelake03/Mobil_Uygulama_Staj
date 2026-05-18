import 'dart:convert';
import 'dart:io';
import '../models/product.dart';

class ApiService {
  static const _url = 'https://wantapi.com/products.php';

  static Future<List<Product>> fetchProducts() async {
    try {
      final client = HttpClient()
        ..connectionTimeout = const Duration(seconds: 10);
      final request = await client.getUrl(Uri.parse(_url));
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      client.close();
      final data = json.decode(body);
      if (data is List) {
        return data
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (_) {
      return _mockProducts;
    }
  }

  static final List<Product> _mockProducts = [
    const Product(
      id: 1,
      name: 'AirPods Pro (2nd Gen)',
      category: 'Apple Audio',
      price: 249,
      description:
          'AirPods Pro (2nd generation) feature up to 2x more Active Noise Cancellation. Adaptive Transparency lets in the sounds of the world around you, and Personalized Spatial Audio with dynamic head tracking places sound all around you.',
      image:
          'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MQTP3?wid=532&hei=532&fmt=jpeg',
      specs: {'Size': '2.2 in', 'Audio': '360°', 'Color': '1 color'},
    ),
    const Product(
      id: 2,
      name: 'AirPods Max',
      category: 'Apple Audio',
      price: 549,
      description:
          'AirPods Max combine high-fidelity audio with industry-leading Active Noise Cancellation to deliver an unparalleled listening experience with Spatial Audio.',
      image:
          'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airpods-max-select-midnight-202409?wid=532&hei=532&fmt=jpeg',
      specs: {'Size': 'Over-ear', 'Audio': 'Spatial', 'Color': '5 colors'},
    ),
    const Product(
      id: 3,
      name: 'HomePod',
      category: 'Apple Smart',
      price: 299,
      description:
          'HomePod delivers high-quality audio in any room. Featuring a powerful S9 chip, room-sensing technology, and multiroom audio via AirPlay.',
      image:
          'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/homepod-select-202301?wid=532&hei=532&fmt=jpeg',
      specs: {'Size': '6.6 in', 'Audio': '360°', 'Color': '2 colors'},
    ),
    const Product(
      id: 4,
      name: 'HomePod Mini',
      category: 'Apple Smart',
      price: 99,
      description:
          'HomePod mini is jam-packed with innovation, delivering unexpectedly big sound for its size. At just 3.3 inches tall it fills the room with rich 360-degree audio.',
      image:
          'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/homepod-mini-select-yellow-202210?wid=532&hei=532&fmt=jpeg',
      specs: {'Size': '3.3 in', 'Audio': '360°', 'Color': '5 colors'},
    ),
    const Product(
      id: 5,
      name: 'iPhone 15 Pro',
      category: 'Apple iPhone',
      price: 999,
      description:
          'iPhone 15 Pro features a titanium design with A17 Pro chip, a versatile Pro camera system with a 48MP main camera, and the new Action button.',
      image:
          'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-1inch-bluetitanium?wid=532&hei=532&fmt=jpeg',
      specs: {'Size': '6.1 in', 'Chip': 'A17 Pro', 'Color': '4 colors'},
    ),
    const Product(
      id: 6,
      name: 'MacBook Pro 14"',
      category: 'Apple Mac',
      price: 1999,
      description:
          'MacBook Pro 14-inch with M3 chip delivers groundbreaking performance with up to 22 hours of battery life and a stunning Liquid Retina XDR display.',
      image:
          'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp14-spacegray-select-202301?wid=532&hei=532&fmt=jpeg',
      specs: {'Size': '14 in', 'Chip': 'M3 Pro', 'Color': '2 colors'},
    ),
    const Product(
      id: 7,
      name: 'iPad Air',
      category: 'Apple iPad',
      price: 599,
      description:
          'iPad Air with M2 chip. Supercharged by M2, iPad Air handles demanding tasks effortlessly with a stunning 11-inch Liquid Retina display.',
      image:
          'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-air-select-wifi-blue-202203?wid=532&hei=532&fmt=jpeg',
      specs: {'Size': '11 in', 'Chip': 'M2', 'Color': '4 colors'},
    ),
    const Product(
      id: 8,
      name: 'Apple Watch Series 9',
      category: 'Apple Watch',
      price: 399,
      description:
          'Apple Watch Series 9 with S9 chip. Brighter Always-On Retina display, new Double Tap gesture, and all-day battery life.',
      image:
          'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/watch-s9-digitalcrown-202309?wid=532&hei=532&fmt=jpeg',
      specs: {'Size': '45mm', 'Chip': 'S9', 'Color': 'Many'},
    ),
  ];
}
