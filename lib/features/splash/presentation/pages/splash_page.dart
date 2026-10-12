import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/asset_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  Timer? _timer;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: const Interval(0.0, 0.8, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(
        parent: _animController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutBack),
      ),
    );

    _animController.forward();

    // Auto navigate after 2.5 seconds
    _timer = Timer(const Duration(milliseconds: 2500), _navigateToNext);
  }

  void _navigateToNext() {
    if (_navigated || !mounted) return;
    _navigated = true;
    _timer?.cancel();
    Navigator.pushReplacementNamed(context, RouteNames.login);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _navigateToNext,
        child: SizedBox.expand(
          child: SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 3),

                // Center animated content
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // StockForge Hexagonal Emblem
                          Image.asset(
                            AssetConstants.stockforgeEmblem,
                            width: 86,
                            height: 98,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildFallbackEmblem();
                            },
                          ),
                          const SizedBox(height: 12),

                          // Brand Name: StockForge
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Stock',
                                  style: TextStyle(
                                    fontFamily: AppTypography.primaryFont,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF181D19),
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Forge',
                                  style: TextStyle(
                                    fontFamily: AppTypography.primaryFont,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF3CA273),
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),

                          // Brand Subtitle
                          const Text(
                            'Smart Hardware Supply Management',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTypography.primaryFont,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF5F666A),
                              letterSpacing: 0.2,
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Headline
                          const Text(
                            'Hardware Supply Business\nManagement System',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTypography.primaryFont,
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF181D19),
                              height: 1.25,
                              letterSpacing: -0.2,
                            ),
                          ),
                          const SizedBox(height: 14),

                          // Tagline
                          const Text(
                            'Smart Inventory • Smarter Supply\nChain • Better Business',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTypography.primaryFont,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF5A6560),
                              height: 1.45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Spacer(flex: 4),

                // Footer Version
                const Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    'Version 1.0',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8B968F),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackEmblem() {
    return Container(
      width: 86,
      height: 98,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF3CA273), width: 2),
      ),
      child: const Center(
        child: Icon(
          Icons.hub_rounded,
          color: Color(0xFF3CA273),
          size: 44,
        ),
      ),
    );
  }
}
