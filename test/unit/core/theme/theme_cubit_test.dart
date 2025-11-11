import 'package:flutter_test/flutter_test.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/theme_cubit.dart';

void main() {
  group('ThemeCubit', () {
    test('initial state is ThemeInitial', () {
      final cubit = ThemeCubit();
      expect(cubit.state, isA<ThemeInitial>());
    });

    test('setTheme toggles to ThemeLight/ThemeDark', () {
      final cubit = ThemeCubit();
      cubit.setTheme(false);
      expect(cubit.state, anyOf(isA<ThemeLight>(), isA<ThemeDark>()));
      final first = cubit.state;
      cubit.setTheme(true);
      expect(cubit.state.runtimeType != first.runtimeType, isTrue);
    });

    test('toggleTheme flips between light and dark', () {
      final cubit = ThemeCubit()..setTheme(false);
      final first = cubit.state;
      cubit.toggleTheme();
      expect(cubit.state.runtimeType != first.runtimeType, isTrue);
    });
  });
}


