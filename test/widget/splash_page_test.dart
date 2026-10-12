import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hardware_management_system/features/splash/presentation/pages/splash_page.dart';
import 'package:hardware_management_system/app/router/route_names.dart';

void main() {
  testWidgets('SplashPage renders branding and title correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        initialRoute: RouteNames.initial,
        routes: {
          RouteNames.initial: (_) => const SplashPage(),
          RouteNames.login: (_) => const Scaffold(body: Text('Login Screen')),
        },
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.text.toPlainText().contains('StockForge'),
      ),
      findsOneWidget,
    );
    expect(find.text('Smart Hardware Supply Management'), findsOneWidget);
    expect(
      find.text('Hardware Supply Business\nManagement System'),
      findsOneWidget,
    );
    expect(find.text('Version 1.0'), findsOneWidget);

    // Pump timer duration to verify auto navigation
    await tester.pump(const Duration(milliseconds: 3000));
    await tester.pumpAndSettle();

    expect(find.text('Login Screen'), findsOneWidget);
  });
}
