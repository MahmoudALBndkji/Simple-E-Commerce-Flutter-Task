import 'dart:convert';
import '../../../../helpers/mocks.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_ecommerce_flutter_task/features/cart/view_model/cubit/cart_cubit.dart';




void main() {
  group('CartCubit', () {
    late MockApiService mockService;
    late CartCubit cubit;

    setUp(() {
      mockService = MockApiService();
      cubit = CartCubit(service: mockService);
    });

    blocTest<CartCubit, CartState>(
      'getAllCarts emits success on 200',
      build: () => cubit,
      act: (c) {
        final cartsJson = json.encode([
          {
            "id": 1,
            "userId": 1,
            "date": "2020-03-02",
            "products": [
              {"productId": 1, "quantity": 2}
            ],
            "__v": 0
          }
        ]);
        when(
          () => mockService.requestApi(
            requestType: any(named: 'requestType'),
            endPoint: any(named: 'endPoint'),
            context: any(named: 'context'),
            isMultiPartForm: any(named: 'isMultiPartForm'),
            fields: any(named: 'fields'),
            headers: any(named: 'headers'),
            parameter: any(named: 'parameter'),
            baseUrl: any(named: 'baseUrl'),
            changeFullUrl: any(named: 'changeFullUrl'),
          ),
        ).thenAnswer((_) async => http.Response(cartsJson, 200));

        c.getAllCarts(context: MockBuildContext());
      },
      expect: () => [
        isA<GetAllCartsLoadingState>(),
        isA<GetAllCartsSuccessState>(),
      ],
    );

    blocTest<CartCubit, CartState>(
      'getAllCarts emits error on exception',
      build: () => cubit,
      act: (c) {
        when(
          () => mockService.requestApi(
            requestType: any(named: 'requestType'),
            endPoint: any(named: 'endPoint'),
            context: any(named: 'context'),
            isMultiPartForm: any(named: 'isMultiPartForm'),
            fields: any(named: 'fields'),
            headers: any(named: 'headers'),
            parameter: any(named: 'parameter'),
            baseUrl: any(named: 'baseUrl'),
            changeFullUrl: any(named: 'changeFullUrl'),
          ),
        ).thenThrow(Exception('boom'));
        c.getAllCarts(context: MockBuildContext());
      },
      expect: () => [
        isA<GetAllCartsLoadingState>(),
        isA<GetAllCartsErrorState>(),
      ],
    );
  });
}


