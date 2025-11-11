import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_ecommerce_flutter_task/features/auth/views/login_layout.dart';

void main() {
  testWidgets('LoginMobileView shows fields and toggles password visibility',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginLayout()));
    await tester.pumpAndSettle();

    // Two TextFormFields: username and password
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Initially visibility icon should be present, tap to toggle
    final visIcon = find.byIcon(Icons.visibility);
    expect(visIcon, findsOneWidget);
    await tester.tap(visIcon);
    await tester.pump();
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
  });
}


