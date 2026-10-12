import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final _searchController = TextEditingController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _inventoryItems = [
    {
      'title': 'Industrial Steel Beam',
      'subtitle': 'H-Beam S-200 Series',
      'status': 'IN STOCK',
      'statusBg': Color(0xFFE8F5E9),
      'statusColor': Color(0xFF2E7D32),
      'available': '1,240 Units',
      'availableColor': Color(0xFF181D19),
      'minimum': '300 Units',
    },
    {
      'title': 'Concrete Anchor Bolts',
      'subtitle': 'M12 × 120mm Galvanized',
      'status': 'LOW STOCK',
      'statusBg': Color(0xFFFEF3C7),
      'statusColor': Color(0xFF92400E),
      'available': '45 Units',
      'availableColor': Color(0xFF92400E),
      'minimum': '150 Units',
    },
    {
      'title': 'PVC Conduit Pipes',
      'subtitle': '25mm Heavy Duty (4m)',
      'status': 'OUT OF STOCK',
      'statusBg': Color(0xFFF3F4F6),
      'statusColor': Color(0xFF6B7280),
      'available': '0 Units',
      'availableColor': Color(0xFFDC2626),
      'minimum': '500 Units',
    },
    {
      'title': 'Copper Wiring (Coil)',
      'subtitle': '2.5mm² Twin and Earth',
      'status': 'IN STOCK',
      'statusBg': Color(0xFFE8F5E9),
      'statusColor': Color(0xFF2E7D32),
      'available': '88 Coils',
      'availableColor': Color(0xFF181D19),
      'minimum': '20 Coils',
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
          'Inventory',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF181D19),
          ),
        ),
        actions: [
          // Notification Bell with Badge Dot
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: Color(0xFF181D19),
                  size: 24,
                ),
                onPressed: () {},
              ),
              Positioned(
                top: 13,
                right: 13,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Color(0xFF181D19),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          // User Avatar
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 4.0),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: const Color(0xFFE2E8F0),
              backgroundImage: const AssetImage(AssetConstants.userAvatar),
              child: ClipOval(
                child: Image.asset(
                  AssetConstants.userAvatar,
                  width: 34,
                  height: 34,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person_rounded,
                      color: Color(0xFF475569),
                      size: 20,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onNavigationTap,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF006C44),
        foregroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () =>
            Navigator.pushNamed(context, RouteNames.stockAdjustment),
        child: const Icon(Icons.add, size: 28),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 14,
                  color: Color(0xFF181D19),
                ),
                decoration: InputDecoration(
                  hintText: 'Search Inventory',
                  hintStyle: const TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xFF6B7280),
                    size: 22,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBDCABF)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFBDCABF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF006C44),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Inventory Item Cards
            ...List.generate(_inventoryItems.length, (index) {
              final item = _inventoryItems[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: _buildInventoryCard(item),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryCard(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFBDCABF), width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Title & Status Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF181D19),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item['subtitle'],
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: item['statusBg'],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item['status'],
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    color: item['statusColor'],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Two-column Stock Levels
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Available Stock',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 11.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item['available'],
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: item['availableColor'],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Minimum Stock',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 11.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item['minimum'],
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3E4942),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Update Stock Button
          SizedBox(
            width: double.infinity,
            height: 44,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.stockDetails);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF006C44), width: 1.2),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Update Stock',
                style: TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF006C44),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
