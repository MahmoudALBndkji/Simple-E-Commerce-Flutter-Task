import '../../../../helpers/mocks.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/view_model/authentication_cubit.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(Uri());
  });

  group('AuthenticationCubit', () {
    late MockApiService mockService;
    late AuthenticationCubit cubit;

    setUp(() {
      mockService = MockApiService();
      cubit = AuthenticationCubit(service: mockService);
    });

    blocTest<AuthenticationCubit, AuthenticationState>(
      'emits [LoginLoadingState, LoginSucessState] on success',
      build: () => cubit,
      act: (c) {
        when(
          () => mockService.requestApi(
            requestType: any(named: 'requestType'),
            endPoint: any(named: 'endPoint'),
            parameter: any(named: 'parameter'),
            context: any(named: 'context'),
            isMultiPartForm: any(named: 'isMultiPartForm'),
            fields: any(named: 'fields'),
            headers: any(named: 'headers'),
            baseUrl: any(named: 'baseUrl'),
            changeFullUrl: any(named: 'changeFullUrl'),
          ),
        ).thenAnswer(
          (_) async => http.Response('{"token":"abc"}', 200),
        );
        c.userLogin(
          context: MockBuildContext(),
          username: 'user',
          password: 'pass',
        );
      },
      expect: () => [isA<LoginLoadingState>(), isA<LoginSucessState>()],
    );

    blocTest<AuthenticationCubit, AuthenticationState>(
      'emits [LoginLoadingState, LoginErrorState] on exception',
      build: () => cubit,
      act: (c) {
        when(
          () => mockService.requestApi(
            requestType: any(named: 'requestType'),
            endPoint: any(named: 'endPoint'),
            parameter: any(named: 'parameter'),
            context: any(named: 'context'),
            isMultiPartForm: any(named: 'isMultiPartForm'),
            fields: any(named: 'fields'),
            headers: any(named: 'headers'),
            baseUrl: any(named: 'baseUrl'),
            changeFullUrl: any(named: 'changeFullUrl'),
          ),
        ).thenThrow(Exception('network error'));
        c.userLogin(
          context: MockBuildContext(),
          username: 'user',
          password: 'pass',
        );
      },
      expect: () => [isA<LoginLoadingState>(), isA<LoginErrorState>()],
    );
  });
}


