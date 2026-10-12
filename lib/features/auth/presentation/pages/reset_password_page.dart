import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/utils/helpers.dart';

class ResetPasswordPage extends StatefulWidget {
  final String? email;

  const ResetPasswordPage({
    super.key,
    this.email,
  });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleReset() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_passwordController.text != _confirmPasswordController.text) {
        Helpers.showSnackBar(context, 'Passwords do not match', isError: true);
        return;
      }

      setState(() => _isLoading = true);
      Future.delayed(const Duration(milliseconds: 900), () {
        if (mounted) {
          setState(() => _isLoading = false);
          Helpers.showSnackBar(
            context,
            'Password has been reset successfully! Please sign in.',
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.login,
            (r) => false,
          );
        }
      });
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
          'Reset Password',
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
                            Icons.lock_reset_rounded,
                            color: Colors.white,
                            size: 38,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Title
                    const Text(
                      'Create New Password',
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
                    Text(
                      widget.email != null && widget.email!.isNotEmpty
                          ? 'Set a new password for ${widget.email}.\nYour password must be at least 6 characters.'
                          : 'Your new password must be at least 6 characters\nand different from previous passwords.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4B5563),
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // New Password Label
                    const Text(
                      'New Password',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF181D19),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // New Password Input
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      validator: Validators.password,
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        color: Color(0xFF181D19),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter new password',
                        hintStyle: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Color(0xFF6B7280),
                          size: 20,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xFF6B7280),
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() => _obscurePassword = !_obscurePassword);
                          },
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
                    const SizedBox(height: 18),

                    // Confirm Password Label
                    const Text(
                      'Confirm New Password',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF181D19),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Confirm Password Input
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (val != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        color: Color(0xFF181D19),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Re-enter new password',
                        hintStyle: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Color(0xFF6B7280),
                          size: 20,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xFF6B7280),
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() =>
                                _obscureConfirmPassword = !_obscureConfirmPassword);
                          },
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
                    const SizedBox(height: 28),

                    // Reset Password Button
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleReset,
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
                                'Reset Password',
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
                                  'Security Reminder',
                                  style: TextStyle(
                                    fontFamily: AppTypography.primaryFont,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Choose a strong password containing letters, numbers, and symbols. Once changed, you will be required to log in with your new password.',
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
