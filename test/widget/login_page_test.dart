import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hardware_management_system/features/auth/presentation/pages/login_page.dart';
import 'package:hardware_management_system/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:hardware_management_system/app/router/route_names.dart';

void main() {
  testWidgets('LoginPage renders Figma design components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 950);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.text('Welcome to StockForge'), findsOneWidget);
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Enter your email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Enter your password'), findsOneWidget);
    expect(find.text('Remember Me'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Need help?'), findsOneWidget);
    expect(find.text('Contact your administrator.'), findsOneWidget);
    expect(find.text('Version 1.0'), findsOneWidget);
  });

  testWidgets('LoginPage password visibility toggle works', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
    await tester.tap(find.byIcon(Icons.visibility_outlined));
    await tester.pump();
    expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
  });

  testWidgets('LoginPage navigation to ForgotPasswordPage works', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const LoginPage(),
        routes: {
          RouteNames.forgotPassword: (_) => const ForgotPasswordPage(),
        },
      ),
    );

    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();

    expect(find.text('Send Verification Code'), findsOneWidget);
  });

  testWidgets('ForgotPasswordPage renders Figma design components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 960);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MaterialApp(home: ForgotPasswordPage()));

    // Title in app bar and page body
    expect(find.text('Forgot Password'), findsNWidgets(2));
    expect(
      find.text(
        'Enter your registered email address\nand we\'ll send you a 6-digit verification code\nto reset your password.',
      ),
      findsOneWidget,
    );
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('example@email.com'), findsOneWidget);
    expect(
      find.text('Use the email associated with your account.'),
      findsOneWidget,
    );
    expect(find.text('Send Verification Code'), findsOneWidget);
    expect(find.text('Back to Login'), findsOneWidget);
    expect(find.text('Need Assistance?'), findsOneWidget);
    expect(
      find.text(
        'If you no longer have access to your registered email address, please contact your system administrator for help recovering your account.',
      ),
      findsOneWidget,
    );
  });
}
