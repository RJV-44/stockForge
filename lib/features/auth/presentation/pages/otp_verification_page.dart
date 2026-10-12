import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/config/email_config.dart';
import '../../../../core/services/email_service.dart';
import '../../../../core/utils/helpers.dart';

class OtpVerificationPage extends StatefulWidget {
  final String email;

  const OtpVerificationPage({
    super.key,
    required this.email,
  });

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  static const int _otpLength = 6;
  static const int _resendCooldownSeconds = 60;

  final List<TextEditingController> _controllers =
      List.generate(_otpLength, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
      List.generate(_otpLength, (_) => FocusNode());

  bool _isLoading = false;
  bool _isResending = false;
  String? _errorMessage;

  Timer? _timer;
  int _secondsRemaining = _resendCooldownSeconds;

  String? _demoCode;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
    _fetchDemoCode();
  }

  void _fetchDemoCode() {
    if (!EmailConfig.isConfigured) {
      setState(() {
        _demoCode = EmailService.instance.getActiveOtp(widget.email);
      });
    }
  }

  void _startResendTimer() {
    _timer?.cancel();
    setState(() => _secondsRemaining = _resendCooldownSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _currentOtp =>
      _controllers.map((c) => c.text.trim()).join();

  void _handleOtpChanged(int index, String value) {
    setState(() => _errorMessage = null);

    // If pasted full OTP (e.g. 6 digits at once)
    if (value.length > 1) {
      final digits = value.replaceAll(RegExp(r'\D'), '');
      if (digits.isNotEmpty) {
        for (int i = 0; i < _otpLength; i++) {
          if (i < digits.length) {
            _controllers[i].text = digits[i];
          }
        }
        final nextIndex = digits.length < _otpLength ? digits.length : _otpLength - 1;
        _focusNodes[nextIndex].requestFocus();
        if (digits.length >= _otpLength) {
          _handleVerify();
        }
        return;
      }
    }

    // Moving focus forward
    if (value.isNotEmpty) {
      if (index < _otpLength - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        if (_currentOtp.length == _otpLength) {
          _handleVerify();
        }
      }
    }
  }

  void _handleKeyDown(int index, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (_controllers[index].text.isEmpty && index > 0) {
        _controllers[index - 1].clear();
        _focusNodes[index - 1].requestFocus();
      }
    }
  }

  void _fillDemoOtp() {
    if (_demoCode != null && _demoCode!.length == _otpLength) {
      for (int i = 0; i < _otpLength; i++) {
        _controllers[i].text = _demoCode![i];
      }
      setState(() => _errorMessage = null);
      _handleVerify();
    }
  }

  Future<void> _handleVerify() async {
    final otp = _currentOtp;
    if (otp.length != _otpLength) {
      setState(() => _errorMessage = 'Please enter all $_otpLength digits.');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Verification check via EmailService
    await Future.delayed(const Duration(milliseconds: 600));

    if (!mounted) return;

    final result = EmailService.instance.verifyOtp(
      recipientEmail: widget.email,
      enteredOtp: otp,
    );

    setState(() => _isLoading = false);

    if (result.success) {
      Helpers.showSnackBar(context, 'Verification successful!');
      Navigator.pushReplacementNamed(
        context,
        RouteNames.resetPassword,
        arguments: widget.email,
      );
    } else {
      setState(() => _errorMessage = result.message);
      Helpers.showSnackBar(context, result.message, isError: true);
    }
  }

  Future<void> _handleResend() async {
    if (_secondsRemaining > 0 || _isResending) return;

    setState(() {
      _isResending = true;
      _errorMessage = null;
    });

    final result = await EmailService.instance.sendOtpEmail(widget.email);

    if (!mounted) return;

    setState(() {
      _isResending = false;
      if (!EmailConfig.isConfigured) {
        _demoCode = result.code;
      }
    });

    if (result.success) {
      // Clear inputs
      for (final controller in _controllers) {
        controller.clear();
      }
      _focusNodes[0].requestFocus();
      _startResendTimer();
      Helpers.showSnackBar(context, 'New verification code sent to ${widget.email}');
    } else {
      Helpers.showSnackBar(context, result.message, isError: true);
    }
  }

  String _formatTimer(int seconds) {
    final mins = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$mins:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6FBF4),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF181D19)),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'OTP Verification',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF181D19),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 28.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Circular Green Badge
                  Center(
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.mark_email_read_outlined,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Title
                  const Text(
                    'Enter Verification Code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF287A53),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Subtitle & Target Email
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4B5563),
                        height: 1.45,
                      ),
                      children: [
                        const TextSpan(
                          text: 'We have sent a 6-digit verification code to\n',
                        ),
                        TextSpan(
                          text: widget.email.isNotEmpty
                              ? widget.email
                              : 'your email address',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF181D19),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Change Email button
                  Center(
                    child: InkWell(
                      onTap: () => Navigator.maybePop(context),
                      borderRadius: BorderRadius.circular(4),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          'Change Email Address',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF006C44),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Demo Mode Helper Banner (when SMTP credentials are not yet set)
                  if (!EmailConfig.isConfigured && _demoCode != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFFBF3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFBCE3CA),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: Color(0xFF006C44),
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Demo Mode OTP:',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF006C44),
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                Text(
                                  _demoCode!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF181D19),
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: _fillDemoOtp,
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: const Text(
                              'Auto-fill',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],

                  // 6 OTP Digit Inputs
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(_otpLength, (index) {
                      return SizedBox(
                        width: 48,
                        height: 56,
                        child: KeyboardListener(
                          focusNode: FocusNode(),
                          onKeyEvent: (event) => _handleKeyDown(index, event),
                          child: TextFormField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: const TextStyle(
                              fontFamily: AppTypography.primaryFont,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF181D19),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xFFBDCABF),
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: _errorMessage != null
                                      ? AppColors.error
                                      : const Color(0xFFBDCABF),
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                  width: 2.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: AppColors.error,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            onChanged: (val) => _handleOtpChanged(index, val),
                          ),
                        ),
                      );
                    }),
                  ),

                  // Error Message
                  if (_errorMessage != null) ...[
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 16,
                          color: AppColors.error,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(
                              fontFamily: AppTypography.primaryFont,
                              fontSize: 12,
                              color: AppColors.error,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 24),

                  // Verify Button
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleVerify,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Text(
                              'Verify Code',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Resend Code Section
                  Center(
                    child: _secondsRemaining > 0
                        ? RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 13,
                                color: Color(0xFF6B7280),
                              ),
                              children: [
                                const TextSpan(text: "Didn't receive the code? Resend in "),
                                TextSpan(
                                  text: _formatTimer(_secondsRemaining),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF006C44),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Didn't receive the code?",
                                style: TextStyle(
                                  fontFamily: AppTypography.primaryFont,
                                  fontSize: 13,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                              const SizedBox(width: 4),
                              _isResending
                                  ? const SizedBox(
                                      width: 14,
                                      height: 14,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          Color(0xFF006C44),
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: _handleResend,
                                      borderRadius: BorderRadius.circular(4),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 4,
                                          vertical: 2,
                                        ),
                                        child: Text(
                                          'Resend Code',
                                          style: TextStyle(
                                            fontFamily: AppTypography.primaryFont,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF006C44),
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 24),

                  // Back to Login link
                  Center(
                    child: InkWell(
                      onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteNames.login,
                        (r) => false,
                      ),
                      borderRadius: BorderRadius.circular(6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.arrow_back_rounded,
                              size: 16,
                              color: Color(0xFF006C44),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Back to Login',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF006C44),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Need Assistance Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFFBDCABF),
                        width: 1.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Icon(
                            Icons.info,
                            color: Color(0xFF111827),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Need Assistance?',
                                style: TextStyle(
                                  fontFamily: AppTypography.primaryFont,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF111827),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Check your spam or junk folder if you don\'t see the email within a couple of minutes. You can also contact your system administrator.',
                                style: TextStyle(
                                  fontFamily: AppTypography.primaryFont,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF3E4942),
                                  height: 1.45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
