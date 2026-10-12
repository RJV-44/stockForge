/// Email configuration for sending OTP verification and notification emails.
///
/// To enable live email sending via Gmail, Hostinger, Outlook, or any SMTP server:
/// 1. For Gmail:
///    - Go to your Google Account (myaccount.google.com) -> Security.
///    - Enable "2-Step Verification" if not already enabled.
///    - Search for "App Passwords" and create a new App Password (e.g. "StockForge").
///    - Paste your Gmail in [senderEmail] and the 16-character App Password in [smtpPassword].
/// 2. For custom SMTP (cPanel, Hostinger, Office 365, etc.):
///    - Fill in [smtpHost], [smtpPort], [senderEmail], [smtpUsername], and [smtpPassword].
///
/// If [smtpPassword] is left blank, the app runs in **Demo Mode**:
/// It will generate authentic 6-digit OTPs, log them to the debug console,
/// and provide a convenient test banner in the app so you can test the full flow
/// without configuring SMTP first!
class EmailConfig {
  EmailConfig._();

  /// SMTP server host (e.g. 'smtp.gmail.com', 'smtp.office365.com', 'smtp.hostinger.com')
  static String smtpHost = 'smtp.gmail.com';

  /// SMTP server port (587 for TLS/STARTTLS, 465 for SSL)
  static int smtpPort = 587;

  /// The email address used to send emails
  /// Example: 'yourname@gmail.com' or 'noreply@yourdomain.com'
  static String senderEmail = '';

  /// The display name shown in the recipient's inbox
  static String senderName = 'StockForge Hardware System';

  /// SMTP username (usually identical to [senderEmail])
  static String smtpUsername = '';

  /// SMTP password or App Password (16-character Google App Password)
  /// NOTE: Never commit sensitive production credentials to public repositories!
  static String smtpPassword = '';

  /// Whether to use TLS encryption (recommended true for port 587)
  static bool useTls = true;

  /// Returns true if SMTP credentials have been provided
  static bool get isConfigured =>
      senderEmail.trim().isNotEmpty && smtpPassword.trim().isNotEmpty;
}
