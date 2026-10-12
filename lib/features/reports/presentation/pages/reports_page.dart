import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  int _currentIndex = 3;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _reports = [
    {
      'title': 'Sales Report',
      'description': 'Daily and monthly sales performance.',
      'icon': Icons.trending_up_rounded,
      'route': RouteNames.orders,
    },
    {
      'title': 'Purchase Report',
      'description': 'Tracking procurement and supplier orders.',
      'icon': Icons.shopping_bag_outlined,
      'route': RouteNames.purchaseOrders,
    },
    {
      'title': 'Inventory Report',
      'description': 'Current stock levels and movements.',
      'icon': Icons.inventory_2_outlined,
      'route': RouteNames.inventory,
    },
    {
      'title': 'Supplier Report',
      'description': 'Supplier performance and contact list.',
      'icon': Icons.business_outlined,
      'route': RouteNames.addSupplier,
    },
    {
      'title': 'Customer Report',
      'description': 'Customer purchase history and details.',
      'icon': Icons.group_outlined,
      'route': RouteNames.customerDetails,
    },
    {
      'title': 'Delivery Report',
      'description': 'Logistics and shipment status overview.',
      'icon': Icons.local_shipping_outlined,
      'route': RouteNames.orders,
    },
    {
      'title': 'Invoice Report',
      'description': 'Financial breakdown and payment status.',
      'icon': Icons.receipt_long_outlined,
      'route': RouteNames.invoiceDetails,
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
          icon: const Icon(Icons.arrow_back, color: Color(0xFF181D19)),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Reports',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF181D19),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              color: Color(0xFF181D19),
              size: 24,
            ),
            onPressed: () {},
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
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            // Search Input
            _buildSearchInput(),
            const SizedBox(height: 16),

            // Report Cards
            ..._reports.map((report) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildReportCard(report),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0x99BDCABF),
          width: 1.0,
        ),
      ),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(
          fontFamily: AppTypography.primaryFont,
          fontSize: 14,
          color: Color(0xFF181D19),
        ),
        decoration: const InputDecoration(
          hintText: 'Search Report',
          hintStyle: TextStyle(
            fontFamily: AppTypography.primaryFont,
            color: Color(0xFF6B7280),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Color(0xFF6B7280),
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildReportCard(Map<String, dynamic> report) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0x80BDCABF),
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Badge
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF3CA474),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  report['icon'] as IconData,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),

              // Title & Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report['title'] as String,
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF181D19),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      report['description'] as String,
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // View Report Action Link
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                final route = report['route'] as String?;
                if (route != null) {
                  Navigator.pushNamed(context, route);
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  'View Report',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF006C44),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
