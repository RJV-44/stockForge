import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import '../config/email_config.dart';

/// Result object returned by [EmailService]
class EmailResult {
  final bool success;
  final String message;
  final bool isSimulated;
  final String? code;

  const EmailResult({
    required this.success,
    required this.message,
    this.isSimulated = false,
    this.code,
  });
}

/// Information about an active OTP session
class OtpSession {
  final String code;
  final DateTime expiresAt;
  final int attempts;

  OtpSession({
    required this.code,
    required this.expiresAt,
    this.attempts = 0,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  OtpSession copyWith({int? attempts}) {
    return OtpSession(
      code: code,
      expiresAt: expiresAt,
      attempts: attempts ?? this.attempts,
    );
  }
}

/// Service handling OTP generation, email dispatching via SMTP, and validation.
class EmailService {
  EmailService._();
  static final EmailService instance = EmailService._();

  // Active OTP sessions mapped by lowercase email
  final Map<String, OtpSession> _sessions = {};

  /// Generates a secure random 6-digit OTP
  String generateOtp({int length = 6}) {
    final random = Random.secure();
    final buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
      buffer.write(random.nextInt(10));
    }
    return buffer.toString();
  }

  /// Sends an OTP to the given [recipientEmail].
  ///
  /// If [EmailConfig.isConfigured] is false, this runs in **Demo Mode**:
  /// it generates a real OTP and stores it for verification, prints it to
  /// the console, and returns [isSimulated] = true so the UI can optionally
  /// guide the tester.
  Future<EmailResult> sendOtpEmail(String recipientEmail) async {
    final cleanEmail = recipientEmail.trim().toLowerCase();
    if (cleanEmail.isEmpty) {
      return const EmailResult(
        success: false,
        message: 'Recipient email cannot be empty',
      );
    }

    final otpCode = generateOtp(length: 6);
    final expiryTime = DateTime.now().add(const Duration(minutes: 10));

    // Store active session
    _sessions[cleanEmail] = OtpSession(
      code: otpCode,
      expiresAt: expiryTime,
    );

    // If SMTP is not yet configured, provide seamless demo mode
    if (!EmailConfig.isConfigured) {
      await Future.delayed(const Duration(milliseconds: 600));

      debugPrint('====================================================');
      debugPrint('[StockForge OTP Service] DEMO MODE ACTIVE');
      debugPrint('Recipient: $cleanEmail');
      debugPrint('Generated OTP Code: $otpCode');
      debugPrint('Expires At: $expiryTime (10 minutes)');
      debugPrint('NOTE: To send real emails, configure lib/core/config/email_config.dart');
      debugPrint('====================================================');

      return EmailResult(
        success: true,
        message: 'Verification code sent to $cleanEmail',
        isSimulated: true,
        code: otpCode,
      );
    }

    // SMTP credentials are configured: send live email
    try {
      final smtpServer = _buildSmtpServer();

      final message = Message()
        ..from = Address(EmailConfig.senderEmail, EmailConfig.senderName)
        ..recipients.add(cleanEmail)
        ..subject = 'StockForge Verification Code: $otpCode'
        ..text = _buildPlainTextEmail(otpCode)
        ..html = _buildHtmlEmail(otpCode);

      await send(message, smtpServer);

      debugPrint('[StockForge OTP Service] Live email successfully sent to $cleanEmail');

      return EmailResult(
        success: true,
        message: 'Verification code sent to $cleanEmail',
        isSimulated: false,
        code: otpCode,
      );
    } on MailerException catch (e) {
      debugPrint('[StockForge OTP Service] MailerException: ${e.message}');
      for (final p in e.problems) {
        debugPrint('Problem: ${p.code}: ${p.msg}');
      }
      return EmailResult(
        success: false,
        message: 'Failed to send email: ${e.message}. Please check SMTP configuration.',
        code: otpCode,
      );
    } catch (e) {
      debugPrint('[StockForge OTP Service] General Error sending email: $e');
      return EmailResult(
        success: false,
        message: 'Could not send verification email: $e',
        code: otpCode,
      );
    }
  }

  /// Verifies if [enteredOtp] matches the active OTP for [recipientEmail].
  EmailResult verifyOtp({
    required String recipientEmail,
    required String enteredOtp,
  }) {
    final cleanEmail = recipientEmail.trim().toLowerCase();
    final cleanOtp = enteredOtp.trim();

    final session = _sessions[cleanEmail];
    if (session == null) {
      return const EmailResult(
        success: false,
        message: 'No verification code requested for this email. Please request a code.',
      );
    }

    if (session.isExpired) {
      _sessions.remove(cleanEmail);
      return const EmailResult(
        success: false,
        message: 'Verification code has expired. Please request a new one.',
      );
    }

    if (session.attempts >= 5) {
      _sessions.remove(cleanEmail);
      return const EmailResult(
        success: false,
        message: 'Too many incorrect attempts. Please request a new verification code.',
      );
    }

    if (session.code != cleanOtp) {
      _sessions[cleanEmail] = session.copyWith(attempts: session.attempts + 1);
      final remaining = 5 - (session.attempts + 1);
      return EmailResult(
        success: false,
        message: 'Invalid verification code. ($remaining attempts remaining)',
      );
    }

    // Successfully verified: clear the session
    _sessions.remove(cleanEmail);
    return const EmailResult(
      success: true,
      message: 'Email successfully verified!',
    );
  }

  /// Returns the current active OTP code for [recipientEmail] (useful for demo display or tests)
  String? getActiveOtp(String recipientEmail) {
    final cleanEmail = recipientEmail.trim().toLowerCase();
    final session = _sessions[cleanEmail];
    if (session != null && !session.isExpired) {
      return session.code;
    }
    return null;
  }

  /// Builds the SMTP Server connection
  SmtpServer _buildSmtpServer() {
    final username = EmailConfig.smtpUsername.isNotEmpty
        ? EmailConfig.smtpUsername
        : EmailConfig.senderEmail;

    if (EmailConfig.smtpHost.toLowerCase().contains('gmail')) {
      return gmail(username, EmailConfig.smtpPassword);
    }

    return SmtpServer(
      EmailConfig.smtpHost,
      port: EmailConfig.smtpPort,
      ssl: EmailConfig.smtpPort == 465,
      allowInsecure: false,
      username: username,
      password: EmailConfig.smtpPassword,
    );
  }

  /// Plain-text email body fallback
  String _buildPlainTextEmail(String otpCode) {
    return '''
StockForge Hardware Management System
Password Reset Verification

Your verification code is: $otpCode

This code is valid for 10 minutes.
If you did not request a password reset, please ignore this email or contact your system administrator.

Best regards,
StockForge Security Team
''';
  }

  /// Responsive, styled HTML email body matching StockForge green branding
  String _buildHtmlEmail(String otpCode) {
    return '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>StockForge Verification Code</title>
</head>
<body style="margin: 0; padding: 0; background-color: #F6FBF4; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; color: #181D19;">
  <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color: #F6FBF4; padding: 36px 12px;">
    <tr>
      <td align="center">
        <table role="presentation" width="100%" style="max-width: 520px; background-color: #FFFFFF; border-radius: 16px; border: 1px solid #BDCABF; box-shadow: 0 4px 16px rgba(0,0,0,0.04); overflow: hidden;">
          <!-- Header Banner -->
          <tr>
            <td align="center" style="background: linear-gradient(135deg, #006C44 0%, #4CAF7D 100%); padding: 32px 24px; text-align: center;">
              <div style="background-color: rgba(255,255,255,0.2); width: 64px; height: 64px; border-radius: 50%; margin: 0 auto 14px auto; display: flex; align-items: center; justify-content: center; line-height: 64px;">
                <span style="font-size: 32px; color: #FFFFFF;">&#128274;</span>
              </div>
              <h1 style="margin: 0; color: #FFFFFF; font-size: 22px; font-weight: 700; letter-spacing: 0.5px;">StockForge</h1>
              <p style="margin: 4px 0 0 0; color: #E8F5E9; font-size: 13px; font-weight: 400;">Hardware Management System</p>
            </td>
          </tr>

          <!-- Content Body -->
          <tr>
            <td style="padding: 32px 28px;">
              <h2 style="margin: 0 0 12px 0; color: #181D19; font-size: 18px; font-weight: 700; text-align: center;">Password Reset Verification</h2>
              <p style="margin: 0 0 24px 0; color: #4B5563; font-size: 14px; line-height: 1.5; text-align: center;">
                We received a request to reset the password for your StockForge account. Use the verification code below to complete the request:
              </p>

              <!-- OTP Code Box -->
              <div style="background-color: #F6FBF4; border: 2px dashed #4CAF7D; border-radius: 12px; padding: 20px; text-align: center; margin: 0 0 24px 0;">
                <span style="display: block; color: #006C44; font-size: 12px; font-weight: 600; text-transform: uppercase; letter-spacing: 1.5px; margin-bottom: 6px;">Your 6-Digit Code</span>
                <span style="display: inline-block; font-size: 36px; font-weight: 800; color: #006C44; letter-spacing: 10px; font-family: monospace;">$otpCode</span>
                <span style="display: block; color: #6B7280; font-size: 12px; margin-top: 8px;">Valid for 10 minutes</span>
              </div>

              <!-- Security notice -->
              <table role="presentation" width="100%" style="background-color: #F9FAFB; border-radius: 8px; border-left: 4px solid #EAB308; margin-bottom: 24px;">
                <tr>
                  <td style="padding: 12px 14px;">
                    <p style="margin: 0; color: #4B5563; font-size: 12px; line-height: 1.45;">
                      <strong>Security Note:</strong> Never share this verification code with anyone. StockForge staff will never ask for your code.
                    </p>
                  </td>
                </tr>
              </table>

              <p style="margin: 0; color: #6B7280; font-size: 13px; line-height: 1.45; text-align: center;">
                If you did not make this request, you can safely ignore this email. Your password will remain unchanged.
              </p>
            </td>
          </tr>

          <!-- Footer -->
          <tr>
            <td style="padding: 18px 24px; background-color: #F9FAFB; border-top: 1px solid #E5E7EB; text-align: center;">
              <p style="margin: 0; color: #9CA3AF; font-size: 11px;">
                &copy; StockForge Hardware Management System. All rights reserved.
              </p>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
''';
  }
}
