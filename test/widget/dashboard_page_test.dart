import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hardware_management_system/features/dashboard/presentation/pages/dashboard_page.dart';

void main() {
  testWidgets('DashboardPage renders Figma design components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardPage(),
      ),
    );

    // Header greeting
    expect(find.text('Good Morning,'), findsOneWidget);
    expect(find.text('Khush Dobariya'), findsOneWidget);

    // Purchase Management, Customers, Invoices, and Suppliers cards
    expect(find.text('Purchase Management'), findsOneWidget);
    expect(find.text('24'), findsOneWidget);
    expect(find.text('Customers'), findsOneWidget);
    expect(find.text('1,248'), findsOneWidget);
    expect(find.text('Invoices'), findsOneWidget);
    expect(find.text('356'), findsOneWidget);
    expect(find.text('Suppliers'), findsOneWidget);
    expect(find.text('86'), findsOneWidget);

    // Low Stock Alerts
    expect(find.text('Low Stock Alerts'), findsOneWidget);
    expect(find.text('View All'), findsOneWidget);
    expect(find.text('Galvanized Steel Pipe 2"'), findsOneWidget);
    expect(find.text('Industrial Drill Bit Set'), findsOneWidget);
    expect(find.text('Low Stock'), findsNWidgets(2));

    // Sales Overview
    expect(find.text('Sales Overview'), findsOneWidget);

    // Recent Orders
    expect(find.text('Recent Orders'), findsOneWidget);
    expect(find.text('ORD-8821'), findsOneWidget);
    expect(find.text('Completed'), findsOneWidget);
    expect(find.text('₹12,450'), findsOneWidget);
    expect(find.text('ORD-8822'), findsOneWidget);
    expect(find.text('Pending'), findsOneWidget);
    expect(find.text('₹4,200'), findsOneWidget);
    expect(find.text('ORD-8823'), findsOneWidget);
    expect(find.text('Processing'), findsOneWidget);
    expect(find.text('₹8,760'), findsOneWidget);
  });
}
