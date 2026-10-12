import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/services/email_service.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/utils/helpers.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      setState(() => _isLoading = true);

      final result = await EmailService.instance.sendOtpEmail(email);

      if (!mounted) return;
      setState(() => _isLoading = false);

      if (result.success) {
        Helpers.showSnackBar(
          context,
          'Verification code sent to $email',
        );
        Navigator.pushNamed(
          context,
          RouteNames.otpVerification,
          arguments: email,
        );
      } else {
        Helpers.showSnackBar(
          context,
          result.message,
          isError: true,
        );
      }
    }
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
          'Forgot Password',
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
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Green circular lock badge
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
                            Icons.lock_outline_rounded,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Title
                    const Text(
                      'Forgot Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF287A53),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Subtitle
                    const Text(
                      'Enter your registered email address\nand we\'ll send you a 6-digit verification code\nto reset your password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4B5563),
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Email Address Label
                    const Text(
                      'Email Address',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF181D19),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Email Input Box
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        color: Color(0xFF181D19),
                      ),
                      decoration: InputDecoration(
                        hintText: 'example@email.com',
                        hintStyle: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Icon(
                          Icons.mail_outline_rounded,
                          color: Color(0xFF6B7280),
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFBDCABF),
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFBDCABF),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                            width: 1.5,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.error,
                            width: 1.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.error,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Helper subtext
                    const Text(
                      'Use the email associated with your account.',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Send Reset Link Button
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleSubmit,
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
                                'Send Verification Code',
                                style: TextStyle(
                                  fontFamily: AppTypography.primaryFont,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Back to Login link
                    Center(
                      child: InkWell(
                        onTap: () => Navigator.maybePop(context),
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
                    const SizedBox(height: 32),

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
                                  'If you no longer have access to your registered email address, please contact your system administrator for help recovering your account.',
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
      ),
    );
  }
}
