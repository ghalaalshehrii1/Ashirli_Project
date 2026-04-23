import 'package:flutter_test/flutter_test.dart';

import 'package:login_demo/main.dart';

void main() {
  testWidgets('App starts on Login with Arabic UI', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('تسجيل الدخول'), findsWidgets);
    expect(find.text('البريد الإلكتروني'), findsOneWidget);
    expect(find.text('طبيب'), findsOneWidget);
    expect(find.text('مريض'), findsOneWidget);
  });
}
