import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class SuppliersPage extends StatefulWidget {
  const SuppliersPage({super.key});

  @override
  State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState extends State<SuppliersPage> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _suppliers = [
    {
      'name': 'Global Hardware Solutions',
      'isPreferred': true,
      'phone': '+1 (555) 012-3456',
      'email': 'contact@globalhw.com',
      'location': 'Chicago, IL',
      'icon': Icons.inventory_2_outlined,
    },
    {
      'name': 'Apex Industrial Parts',
      'isPreferred': false,
      'phone': '+1 (555) 987-6543',
      'email': 'sales@apexindustrial.net',
      'location': 'Detroit, MI',
      'icon': Icons.factory_outlined,
    },
    {
      'name': 'Steel Works & Co',
      'isPreferred': false,
      'phone': '+91 0000000000',
      'email': 'office@steelworks.com',
      'location': 'Pittsburgh, PA',
      'icon': Icons.handyman_outlined,
    },
    {
      'name': 'Precision Fasteners',
      'isPreferred': false,
      'phone': '+1 (555) 345-6789',
      'email': 'info@pfasteners.io',
      'location': 'Austin, TX',
      'icon': null,
    },
    {
      'name': 'Metro Electricals',
      'isPreferred': false,
      'phone': '+1 (555) 456-7890',
      'email': 'support@metroelec.net',
      'location': 'Seattle, WA',
      'icon': null,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
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
        Navigator.pushReplacementNamed(context, RouteNames.profile);
        break;
    }
  }

  List<Map<String, dynamic>> get _filteredSuppliers {
    final query = _searchController.text.toLowerCase().trim();
    if (query.isEmpty) return _suppliers;
    return _suppliers.where((s) {
      return (s['name'] as String).toLowerCase().contains(query) ||
          (s['location'] as String).toLowerCase().contains(query) ||
          (s['email'] as String).toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final suppliers = _filteredSuppliers;

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
          'Suppliers',
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
          width: 52,
          height: 52,
          child: FloatingActionButton(
            heroTag: 'addSupplierFab',
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.addSupplier);
            },
            backgroundColor: const Color(0xFF005C3B),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 90),
          children: [
            // Search Supplier Field
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (val) => setState(() {}),
                decoration: const InputDecoration(
                  hintText: 'Search Supplier',
                  hintStyle: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14,
                    color: Color(0xFF9CA3AF),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF6B7280),
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Supplier Cards
            ...suppliers.map((supplier) => _buildSupplierCard(supplier)),
          ],
        ),
      ),
    );
  }

  Widget _buildSupplierCard(Map<String, dynamic> supplier) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Name & Right Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  supplier['name'] as String,
                  style: const TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF181D19),
                  ),
                ),
              ),
              if (supplier['icon'] != null)
                Icon(
                  supplier['icon'] as IconData,
                  color: const Color(0xFF9CA3AF),
                  size: 20,
                ),
            ],
          ),

          // Preferred Badge (if preferred)
          if (supplier['isPreferred'] == true) ...[
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFD1FAE5),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'PREFERRED',
                style: TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  color: Color(0xFF065F46),
                ),
              ),
            ),
          ],
          const SizedBox(height: 10),

          // Phone Row
          Row(
            children: [
              const Icon(
                Icons.phone_outlined,
                size: 14,
                color: Color(0xFF4B5563),
              ),
              const SizedBox(width: 8),
              Text(
                supplier['phone'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 13,
                  color: Color(0xFF4B5563),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Email Row
          Row(
            children: [
              const Icon(
                Icons.mail_outline_rounded,
                size: 14,
                color: Color(0xFF4B5563),
              ),
              const SizedBox(width: 8),
              Text(
                supplier['email'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 13,
                  color: Color(0xFF4B5563),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Location Row
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 14,
                color: Color(0xFF4B5563),
              ),
              const SizedBox(width: 8),
              Text(
                supplier['location'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 13,
                  color: Color(0xFF4B5563),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Divider
          const Divider(
            color: Color(0xFFE5E7EB),
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 14),

          // Action Buttons: View & Edit
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.supplierDetails,
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
                      'View',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.addSupplier,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8ECE9),
                      foregroundColor: const Color(0xFF374151),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF374151),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
