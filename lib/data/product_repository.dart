import 'dart:convert';
import 'dart:io';

import '../models/product.dart';

class ProductRepository {
  static const String _productsUrl = 'https://wantapi.com/products.php';
  static const Duration _timeout = Duration(seconds: 10);

  Future<List<Product>> loadProducts() async {
    final client = HttpClient();

    try {
      final request = await client
          .getUrl(Uri.parse(_productsUrl))
          .timeout(_timeout);
      final response = await request.close().timeout(_timeout);

      if (response.statusCode != HttpStatus.ok) {
        throw HttpException('Unexpected status: ${response.statusCode}');
      }

      final body = await response
          .transform(utf8.decoder)
          .join()
          .timeout(_timeout);
      final decoded = jsonDecode(body) as Map<String, dynamic>;
      final items = decoded['data'] as List<dynamic>;

      return items
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList();
    } finally {
      client.close();
    }
  }
}
