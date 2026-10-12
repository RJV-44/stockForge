import 'package:flutter_test/flutter_test.dart';
import 'package:hardware_management_system/core/services/email_service.dart';

void main() {
  group('EmailService Tests', () {
    final emailService = EmailService.instance;
    const testEmail = 'testuser@example.com';

    test('generateOtp creates a 6-digit string', () {
      final otp = emailService.generateOtp(length: 6);
      expect(otp.length, 6);
      expect(int.tryParse(otp), isNotNull);
    });

    test('sendOtpEmail in demo mode returns success with code', () async {
      final result = await emailService.sendOtpEmail(testEmail);
      expect(result.success, true);
      expect(result.isSimulated, true);
      expect(result.code, isNotNull);
      expect(result.code!.length, 6);
    });

    test('verifyOtp returns true with correct code and false with wrong code', () async {
      final sendResult = await emailService.sendOtpEmail(testEmail);
      final correctCode = sendResult.code!;

      // Wrong code
      final failResult = emailService.verifyOtp(
        recipientEmail: testEmail,
        enteredOtp: '000000',
      );
      expect(failResult.success, false);

      // Correct code
      final successResult = emailService.verifyOtp(
        recipientEmail: testEmail,
        enteredOtp: correctCode,
      );
      expect(successResult.success, true);
    });
  });
}
