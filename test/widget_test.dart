import 'package:flutter_test/flutter_test.dart';

import 'package:mini_catalogue_app/models/product.dart';

void main() {
  const json = {
    'id': 1,
    'name': 'iPhone 15 Pro',
    'tagline': 'Titanium. So strong. So light. So Pro.',
    'description': 'The first iPhone with a titanium design.',
    'price': '\$999',
    'currency': 'USD',
    'image': 'https://wantapi.com/assets/images/iphone.png',
    'specs': {'chip': 'A17 Pro', 'material': 'Titanium'},
  };

  test('Product.fromJson reads every field', () {
    final product = Product.fromJson(json);

    expect(product.id, 1);
    expect(product.name, 'iPhone 15 Pro');
    expect(product.price, '\$999');
    expect(product.image, 'https://wantapi.com/assets/images/iphone.png');
    expect(product.specs, {'chip': 'A17 Pro', 'material': 'Titanium'});
  });

  test('Product.fromJson falls back when optional fields are missing', () {
    final product = Product.fromJson({
      'id': 2,
      'name': 'iPhone 15',
      'price': '\$799',
      'image': 'https://wantapi.com/assets/images/iphone_pink.png',
    });

    expect(product.tagline, '');
    expect(product.description, '');
    expect(product.currency, 'USD');
    expect(product.specs, isEmpty);
  });

  test('Product.toJson round-trips through fromJson', () {
    final product = Product.fromJson(json);

    expect(Product.fromJson(product.toJson()).toJson(), product.toJson());
  });
}
