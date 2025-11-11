import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';

void main() {
  group('ProductModel', () {
    test('fromJson and toJson should be inverse operations', () {
      final jsonMap = <String, dynamic>{
        'id': 10,
        'title': 'Test product',
        'price': 99.5,
        'description': 'A product',
        'category': 'electronics',
        'image': 'http://example.com/img.png',
        'rating': {'rate': 4.5, 'count': 12},
      };

      final model = ProductModel.fromJson(jsonMap);
      expect(model.id, 10);
      expect(model.title, 'Test product');
      expect(model.rating?.rate, 4.5);
      expect(model.rating?.count, 12);

      final encoded = json.encode(model.toJson());
      final decoded = json.decode(encoded) as Map<String, dynamic>;

      expect(decoded['id'], jsonMap['id']);
      expect(decoded['title'], jsonMap['title']);
      expect(decoded['price'], jsonMap['price']);
      expect((decoded['rating'] as Map)['rate'], 4.5);
      expect((decoded['rating'] as Map)['count'], 12);
    });
  });
}


