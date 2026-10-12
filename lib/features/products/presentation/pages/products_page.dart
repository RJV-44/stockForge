import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int _currentIndex = 1;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Precision Drill Set',
      'category': 'Power Tools',
      'status': 'In Stock',
      'statusBg': Color(0xFFE8F5E9),
      'statusColor': Color(0xFF2E7D32),
      'price': '\$189.00',
      'stock': '42 units',
      'stockColor': Color(0xFF181D19),
    },
    {
      'name': 'Heavy Duty Shelving',
      'category': 'Storage',
      'status': 'Low Stock',
      'statusBg': Color(0xFFFEF3C7),
      'statusColor': Color(0xFFD97706),
      'price': '\$345.50',
      'stock': '5 units',
      'stockColor': Color(0xFFDC2626),
    },
    {
      'name': 'Industrial Air Compressor',
      'category': 'Machinery',
      'status': 'Out of Stock',
      'statusBg': Color(0xFFE5E7EB),
      'statusColor': Color(0xFF4B5563),
      'price': '\$1,299.00',
      'stock': '0 units',
      'stockColor': Color(0xFF4B5563),
    },
    {
      'name': 'Metric Bolt Assortment',
      'category': 'Fasteners',
      'status': 'In Stock',
      'statusBg': Color(0xFFE8F5E9),
      'statusColor': Color(0xFF2E7D32),
      'price': '\$45.99',
      'stock': '150 units',
      'stockColor': Color(0xFF181D19),
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
          'Products',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF006C44),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3CA474),
        foregroundColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () => Navigator.pushNamed(context, RouteNames.addProduct),
        child: const Icon(Icons.add, size: 28),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            // Search Input
            _buildSearchInput(),
            const SizedBox(height: 12),

            // Filter Button
            _buildFilterButton(),
            const SizedBox(height: 16),

            // Products List
            ..._products.map((product) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _buildProductCard(product),
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
          hintText: 'Search Product',
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

  Widget _buildFilterButton() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xCCBDCABF),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.filter_list_rounded,
              color: Color(0xFF006C44),
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Filter',
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
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0x80BDCABF),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Title & Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  product['name'] as String,
                  style: const TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 15.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF181D19),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: product['statusBg'] as Color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  product['status'] as String,
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: product['statusColor'] as Color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),

          // Category Subtitle
          Text(
            product['category'] as String,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 14),

          // Price & Stock Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 11.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      product['price'] as String,
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF006C44),
                      ),
                    ),
                  ],
                ),
              ),

              // Stock
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Stock',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product['stock'] as String,
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: product['stockColor'] as Color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Actions: View & Edit buttons
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      RouteNames.productDetails,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD6E8FE),
                      foregroundColor: const Color(0xFF1E40AF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'View',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 13.5,
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
                  child: OutlinedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      RouteNames.editProduct,
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF374151),
                      side: const BorderSide(
                        color: Color(0xCCBDCABF),
                        width: 1.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
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
