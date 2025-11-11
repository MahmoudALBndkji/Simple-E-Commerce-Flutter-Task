import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:simple_ecommerce_flutter_task/core/network/local/cache_helper.dart';
import 'package:simple_ecommerce_flutter_task/features/home/layout/home_layout.dart';
import 'package:simple_ecommerce_flutter_task/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Splash navigates to Home when already logged in',
      (tester) async {
    await CacheHelper.instance.init();
    await CacheHelper.instance.write(key: 'isLogin', value: 'true');

    app.main();
    // Allow splash timers to complete
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.byType(HomeLayout), findsOneWidget);
  });
}


