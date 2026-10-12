import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hardware_management_system/features/auth/presentation/pages/otp_verification_page.dart';

void main() {
  testWidgets('OtpVerificationPage renders UI elements properly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OtpVerificationPage(email: 'user@example.com'),
      ),
    );

    // Check title and texts
    expect(find.text('OTP Verification'), findsOneWidget);
    expect(find.text('Enter Verification Code'), findsOneWidget);
    expect(find.text('Verify Code'), findsOneWidget);
    expect(find.text('Back to Login'), findsOneWidget);
    expect(find.text('Need Assistance?'), findsOneWidget);

    // 6 digit text fields
    expect(find.byType(TextFormField), findsNWidgets(6));
  });
}
