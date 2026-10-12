import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class RolesPermissionsPage extends StatefulWidget {
  const RolesPermissionsPage({super.key});

  @override
  State<RolesPermissionsPage> createState() => _RolesPermissionsPageState();
}

class _RolesPermissionsPageState extends State<RolesPermissionsPage> {
  int _currentIndex = 0;
  String _selectedRole = 'Admin';

  final List<String> _availableRoles = ['Admin', 'Manager', 'Staff', 'Viewer'];

  final List<Map<String, dynamic>> _permissions = [
    {'title': 'Manage Products', 'enabled': true},
    {'title': 'Manage Inventory', 'enabled': true},
    {'title': 'Manage Suppliers', 'enabled': true},
    {'title': 'Manage Customers', 'enabled': true},
    {'title': 'Manage Purchase Orders', 'enabled': false},
    {'title': 'Manage Sales Orders', 'enabled': false},
    {'title': 'Manage Invoices', 'enabled': false},
    {'title': 'Manage Deliveries', 'enabled': true},
    {'title': 'View Reports', 'enabled': true},
    {'title': 'Manage Users', 'enabled': false},
    {'title': 'Manage Settings', 'enabled': false},
  ];

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

  void _onRoleChanged(String? newRole) {
    if (newRole == null) return;
    setState(() {
      _selectedRole = newRole;
      if (newRole == 'Admin') {
        _permissions[0]['enabled'] = true; // Products
        _permissions[1]['enabled'] = true; // Inventory
        _permissions[2]['enabled'] = true; // Suppliers
        _permissions[3]['enabled'] = true; // Customers
        _permissions[4]['enabled'] = false; // POs
        _permissions[5]['enabled'] = false; // SOs
        _permissions[6]['enabled'] = false; // Invoices
        _permissions[7]['enabled'] = true; // Deliveries
        _permissions[8]['enabled'] = true; // Reports
        _permissions[9]['enabled'] = false; // Users
        _permissions[10]['enabled'] = false; // Settings
      } else if (newRole == 'Manager') {
        for (var p in _permissions) {
          p['enabled'] = true;
        }
        _permissions[9]['enabled'] = false; // Users
        _permissions[10]['enabled'] = false; // Settings
      } else if (newRole == 'Staff') {
        for (var p in _permissions) {
          p['enabled'] = false;
        }
        _permissions[0]['enabled'] = true;
        _permissions[1]['enabled'] = true;
      }
    });
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
          'Roles & Permissions',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF006C44),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF006C44)),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onNavigationTap,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          children: [
            // Select Role Label
            const Text(
              'Select Role',
              style: TextStyle(
                fontFamily: AppTypography.primaryFont,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF181D19),
              ),
            ),
            const SizedBox(height: 8),

            // Role Selector Card
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFE5E7EB),
                  width: 1.0,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedRole,
                  isExpanded: true,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF6B7280),
                  ),
                  items: _availableRoles.map((role) {
                    return DropdownMenuItem<String>(
                      value: role,
                      child: Text(
                        role,
                        style: const TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF181D19),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: _onRoleChanged,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Permissions Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFE5E7EB),
                  width: 1.0,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Permissions Header
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.shield_outlined,
                          size: 20,
                          color: Color(0xFF3CA474),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Permissions',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF181D19),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFE5E7EB),
                    height: 1,
                    thickness: 1,
                  ),

                  // Permission Checkbox items
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _permissions.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Color(0xFFE5E7EB),
                      height: 1,
                      thickness: 1,
                    ),
                    itemBuilder: (context, index) {
                      final item = _permissions[index];
                      final isChecked = item['enabled'] as bool;

                      return InkWell(
                        onTap: () {
                          setState(() {
                            item['enabled'] = !isChecked;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['title'] as String,
                                style: const TextStyle(
                                  fontFamily: AppTypography.primaryFont,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF181D19),
                                ),
                              ),
                              SizedBox(
                                width: 22,
                                height: 22,
                                child: Checkbox(
                                  value: isChecked,
                                  activeColor: const Color(0xFF2563EB),
                                  checkColor: Colors.white,
                                  side: const BorderSide(
                                    color: Color(0xFF9CA3AF),
                                    width: 1.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      item['enabled'] = val ?? false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Save Permissions Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Permissions saved successfully!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.save_outlined,
                  size: 20,
                  color: Colors.white,
                ),
                label: const Text(
                  'Save Permissions',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3CA474),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Cancel Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () => Navigator.maybePop(context),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(
                    color: Color(0xFFD1D5DB),
                    width: 1.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF006C44),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
