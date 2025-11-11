import 'package:flutter_test/flutter_test.dart';
import 'package:simple_ecommerce_flutter_task/core/services/api_service.dart';
import 'package:simple_ecommerce_flutter_task/features/home/model/product_model.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';

void main() {
  group('HomeCubit cart logic', () {
    late HomeCubit cubit;

    setUp(() {
      cubit = HomeCubit(service: ApiService());
    });

    test('addProductToCart increments quantity for existing product', () {
      final product = ProductModel(id: 1, title: 'A', price: 10);
      cubit.addProductToCart(product);
      expect(cubit.products.length, 1);
      expect(cubit.products.first.quantity, 1);
      cubit.addProductToCart(product);
      expect(cubit.products.length, 1);
      expect(cubit.products.first.quantity, 2);
    });

    test('removeProductFromCart decreases quantity or removes item', () {
      final product = ProductModel(id: 2, title: 'B', price: 5);
      cubit.addProductToCart(product);
      cubit.addProductToCart(product);
      expect(cubit.products.first.quantity, 2);
      cubit.removeProductFromCart(product);
      expect(cubit.products.first.quantity, 1);
      cubit.removeProductFromCart(product);
      expect(cubit.products.where((p) => p.id == 2), isEmpty);
    });

    test('getTotalPrice sums price * quantity', () {
      cubit.products.clear();
      cubit.addProductToCart(ProductModel(id: 1, price: 10));
      cubit.addProductToCart(ProductModel(id: 1, price: 10)); // quantity 2
      cubit.addProductToCart(ProductModel(id: 2, price: 5)); // quantity 1
      expect(cubit.getTotalPrice(), 25);
    });
  });
}


