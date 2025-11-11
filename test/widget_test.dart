import 'package:flutter_test/flutter_test.dart';
import 'package:simple_ecommerce_flutter_task/my_app.dart';

void main() {
  testWidgets('App shows splash title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    // Let initial animations run
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('Simple E-Commerce App'), findsOneWidget);
  });
}
