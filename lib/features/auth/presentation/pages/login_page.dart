import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../core/utils/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted) {
          setState(() => _isLoading = false);
          Navigator.pushReplacementNamed(context, RouteNames.dashboard);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Brand Logo
                    Center(
                      child: Image.asset(
                        AssetConstants.logo,
                        height: 114,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            _buildFallbackLogo(),
                      ),
                    ),
                    const SizedBox(height: 36),

                    // Title
                    const Text(
                      'Welcome to StockForge',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF181D19),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Email Field
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
                        hintText: 'Enter your email',
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
                    const SizedBox(height: 18),

                    // Password Field
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF181D19),
                      ),
                    ),
                    const SizedBox(height: 8),
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
                        hintText: 'Enter your password',
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
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF6B7280),
                            size: 20,
                          ),
                          onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
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
                    const SizedBox(height: 16),

                    // Remember Me & Forgot Password Row
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() => _rememberMe = value ?? false);
                                  },
                                  activeColor: AppColors.primary,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: const BorderSide(
                                    color: Color(0xFFBDCABF),
                                    width: 1.2,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() => _rememberMe = !_rememberMe);
                                  },
                                  child: const Text(
                                    'Remember Me',
                                    style: TextStyle(
                                      fontFamily: AppTypography.primaryFont,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF3E4942),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            RouteNames.forgotPassword,
                          ),
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontFamily: AppTypography.primaryFont,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF006C44),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Sign In Button
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleLogin,
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
                                'Sign In',
                                style: TextStyle(
                                  fontFamily: AppTypography.primaryFont,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 52),

                    // Bottom help info
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Need help?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3E4942),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Contact your administrator.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Version 1.0',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8B928E),
                          ),
                        ),
                      ],
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

  Widget _buildFallbackLogo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AssetConstants.stockforgeEmblem,
          width: 70,
          height: 78,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Stock',
                style: TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF181D19),
                ),
              ),
              TextSpan(
                text: 'Forge',
                style: TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'Smart Hardware Supply Management',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5F666A),
          ),
        ),
      ],
    );
  }
}
