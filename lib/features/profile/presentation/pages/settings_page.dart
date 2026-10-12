import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _currentIndex = 4;
  String _selectedLanguage = 'English (US)';
  String _selectedCurrency = 'Doller';

  bool _orderNotifications = true;
  bool _deliveryNotifications = true;
  bool _inventoryAlerts = false;

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
        Navigator.pushReplacementNamed(context, RouteNames.profile);
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
          icon: const Icon(Icons.arrow_back, color: Color(0xFF006C44)),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF006C44),
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onNavigationTap,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            // Card 1: General
            _buildCard(
              headerIcon: Icons.settings_outlined,
              headerTitle: 'General',
              children: [
                _buildDropdownField(
                  label: 'Language',
                  value: _selectedLanguage,
                  items: const ['English (US)', 'Spanish', 'French', 'German'],
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedLanguage = val);
                  },
                ),
                const SizedBox(height: 12),
                _buildDropdownField(
                  label: 'Default Currency',
                  value: _selectedCurrency,
                  items: const ['Doller', 'EUR', 'INR', 'GBP'],
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedCurrency = val);
                  },
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Card 2: Notifications
            _buildCard(
              headerIcon: Icons.notifications_none_outlined,
              headerTitle: 'Notifications',
              children: [
                _buildSwitchRow(
                  title: 'Order Notifications',
                  subtitle: 'Real-time status of procurement orders',
                  value: _orderNotifications,
                  onChanged: (val) => setState(() => _orderNotifications = val),
                ),
                const SizedBox(height: 14),
                _buildSwitchRow(
                  title: 'Delivery Notifications',
                  subtitle: 'Updates on inbound hardware shipments',
                  value: _deliveryNotifications,
                  onChanged: (val) =>
                      setState(() => _deliveryNotifications = val),
                ),
                const SizedBox(height: 14),
                _buildSwitchRow(
                  title: 'Inventory Alerts',
                  subtitle: 'Warning when SKU levels are low',
                  value: _inventoryAlerts,
                  onChanged: (val) => setState(() => _inventoryAlerts = val),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Card 3: Application
            _buildCard(
              headerIcon: Icons.info_outline,
              headerTitle: 'Application',
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'App Version',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF181D19),
                      ),
                    ),
                    Text(
                      'v2.4.0',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 13,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildNavigationRow('Privacy Policy'),
                const SizedBox(height: 16),
                _buildNavigationRow('Terms & Conditions'),
              ],
            ),
            const SizedBox(height: 14),

            // Card 4: Account
            _buildCard(
              headerIcon: Icons.person_outline,
              headerTitle: 'Account',
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      RouteNames.login,
                    ),
                    icon: const Icon(
                      Icons.logout_rounded,
                      size: 18,
                      color: Color(0xFFDC2626),
                    ),
                    label: const Text(
                      'Logout',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFDC2626),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFFDC2626),
                        width: 1.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Save Settings Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Settings saved successfully'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3CA474),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Save Settings',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData headerIcon,
    required String headerTitle,
    required List<Widget> children,
  }) {
    return Container(
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
            children: [
              Icon(headerIcon, size: 18, color: const Color(0xFF4B5563)),
              const SizedBox(width: 8),
              Text(
                headerTitle,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF181D19),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
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
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0x99BDCABF), width: 1.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF4B5563),
              ),
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 14,
                      color: Color(0xFF181D19),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSwitchRow({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF181D19),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 11.5,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: Colors.white,
          activeTrackColor: const Color(0xFF3CA474),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: const Color(0xFFD1D5DB),
        ),
      ],
    );
  }

  Widget _buildNavigationRow(String title) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF181D19),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Color(0xFF6B7280),
            size: 20,
          ),
        ],
      ),
    );
  }
}
