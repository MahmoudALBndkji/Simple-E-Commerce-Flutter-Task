import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/theme_cubit.dart';
import 'package:simple_ecommerce_flutter_task/core/services/api_service.dart';
import 'package:simple_ecommerce_flutter_task/features/home/layout/home_layout.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';

void main() {
  testWidgets('HomeLayout renders with bottom navigation on mobile width',
      (tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()..setTheme(false)),
          BlocProvider(create: (_) => HomeCubit(service: ApiService())),
        ],
        child: const MaterialApp(home: HomeLayout()),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}


