import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class PurchaseOrdersPage extends StatefulWidget {
  const PurchaseOrdersPage({super.key});

  @override
  State<PurchaseOrdersPage> createState() => _PurchaseOrdersPageState();
}

class _PurchaseOrdersPageState extends State<PurchaseOrdersPage> {
  int _currentIndex = 2;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _purchaseOrders = [
    {
      'id': '#PO-1024',
      'supplier': 'Global Hardware Solutions',
      'date': '10/26/2023',
      'amount': '\$4,250.00',
      'status': 'Completed',
      'statusBg': Color(0xFFE8F5E9),
      'statusColor': Color(0xFF2E7D32),
    },
    {
      'id': '#PO-1025',
      'supplier': 'Titan Tooling Corp',
      'date': '10/27/2023',
      'amount': '\$1,890.25',
      'status': 'Pending',
      'statusBg': Color(0xFFFEF3C7),
      'statusColor': Color(0xFF92400E),
    },
    {
      'id': '#PO-1026',
      'supplier': 'Steel & Alloy Imports',
      'date': '10/28/2023',
      'amount': '\$12,400.00',
      'status': 'Approved',
      'statusBg': Color(0xFFE8F5E9),
      'statusColor': Color(0xFF2E7D32),
    },
    {
      'id': '#PO-1027',
      'supplier': 'Midwest Fasteners',
      'date': '10/29/2023',
      'amount': '\$645.50',
      'status': 'Pending',
      'statusBg': Color(0xFFFEF3C7),
      'statusColor': Color(0xFF92400E),
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
          'Purchase Orders',
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
        backgroundColor: const Color(0xFF006C44),
        foregroundColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () => Navigator.pushNamed(context, RouteNames.createOrder),
        child: const Icon(Icons.add, size: 28),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            // Search Input & Filter Button in one row
            Row(
              children: [
                Expanded(child: _buildSearchInput()),
                const SizedBox(width: 8),
                _buildFilterButton(),
              ],
            ),
            const SizedBox(height: 16),

            // Purchase Order Cards
            ..._purchaseOrders.map((order) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _buildOrderCard(order),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchInput() {
    return Container(
      height: 44,
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
          hintText: 'Search Purchase Order',
          hintStyle: TextStyle(
            fontFamily: AppTypography.primaryFont,
            color: Color(0xFF6B7280),
            fontSize: 13.5,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Color(0xFF6B7280),
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
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
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xCCBDCABF),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.filter_list_rounded,
              color: Color(0xFF181D19),
              size: 18,
            ),
            SizedBox(width: 6),
            Text(
              'Filter',
              style: TextStyle(
                fontFamily: AppTypography.primaryFont,
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                color: Color(0xFF181D19),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
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
          // Row 1: ID & Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order['id'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6B7280),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: order['statusBg'] as Color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  order['status'] as String,
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: order['statusColor'] as Color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Row 2: Supplier Name
          Text(
            order['supplier'] as String,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 15.5,
              fontWeight: FontWeight.w700,
              color: Color(0xFF006C44),
            ),
          ),
          const SizedBox(height: 10),

          // Row 3: Order Date & Total Amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Date',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    order['date'] as String,
                    style: const TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF181D19),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    order['amount'] as String,
                    style: const TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 15.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF181D19),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF3F4F6)),
          const SizedBox(height: 12),

          // Row 4: Action buttons View & Edit
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
                      RouteNames.orderDetails,
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
