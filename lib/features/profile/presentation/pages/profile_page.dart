import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 4;

  final TextEditingController _nameController =
      TextEditingController(text: 'Hardware Admin');
  final TextEditingController _emailController =
      TextEditingController(text: 'admin@hardwaresupply.com');
  final TextEditingController _phoneController =
      TextEditingController(text: '+91 0000000000');
  final TextEditingController _companyController =
      TextEditingController(text: 'HardwareFlow Enterprise');
  final TextEditingController _currentPasswordController =
      TextEditingController(text: 'password1234');
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onNavigationTap(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, RouteNames.dashboard);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, RouteNames.products);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, RouteNames.orders);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, RouteNames.reports);
        break;
      case 4:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6FBF4),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF181D19)),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF181D19),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: Color(0xFF181D19),
              size: 24,
            ),
            onPressed: () => Navigator.pushNamed(context, RouteNames.settings),
          ),
          const SizedBox(width: 8),
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onNavigationTap,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
          children: [
            // Profile Header Card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F7F4),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0x80BDCABF), width: 1.0),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: const Color(0xFFE2E8F0),
                    backgroundImage: const AssetImage(AssetConstants.userAvatar),
                    child: ClipOval(
                      child: Image.asset(
                        AssetConstants.userAvatar,
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.person, size: 36, color: Color(0xFF475569)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Rajvi Lunagariya',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF181D19),
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'Procurement Lead',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Form Fields
            _buildField(
              label: 'Full Name',
              controller: _nameController,
            ),
            const SizedBox(height: 12),
            _buildField(
              label: 'Email Address',
              controller: _emailController,
            ),
            const SizedBox(height: 12),
            _buildField(
              label: 'Phone Number',
              controller: _phoneController,
            ),
            const SizedBox(height: 12),
            _buildField(
              label: 'Company Name',
              controller: _companyController,
            ),
            const SizedBox(height: 16),

            // Security Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0x80BDCABF), width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.shield_outlined,
                        color: Color(0xFF006C44),
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Security',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF181D19),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  _buildField(
                    label: 'Current Password',
                    controller: _currentPasswordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    label: 'New Password',
                    controller: _newPasswordController,
                    hintText: 'Enter new password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    label: 'Confirm New Password',
                    controller: _confirmPasswordController,
                    hintText: 'Confirm new password',
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Actions
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Changes saved successfully'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006C44),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF006C44),
                  side: const BorderSide(color: Color(0xFF006C44), width: 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Change Password',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  RouteNames.login,
                ),
                icon: const Icon(Icons.logout_rounded, size: 18),
                label: const Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF4B5563),
                  side: const BorderSide(color: Color(0xCCBDCABF), width: 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    String? hintText,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            color: Color(0xFF181D19),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0x99BDCABF), width: 1.0),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 14,
              color: Color(0xFF181D19),
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: AppTypography.primaryFont,
                color: Color(0xFF9CA3AF),
                fontSize: 14,
              ),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}
