import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class SalesOrderDetailsPage extends StatefulWidget {
  const SalesOrderDetailsPage({super.key});

  @override
  State<SalesOrderDetailsPage> createState() => _SalesOrderDetailsPageState();
}

class _SalesOrderDetailsPageState extends State<SalesOrderDetailsPage> {
  int _currentIndex = 2;

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
          'Sales Order Details',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF006C44),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
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
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person, size: 20, color: Color(0xFF475569)),
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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            // Card 1: Order Information
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xB2BDCABF),
                  width: 1.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row: ID & Pending Badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'SALES ORDER ID',
                            style: TextStyle(
                              fontFamily: AppTypography.primaryFont,
                              fontSize: 11.5,
                              letterSpacing: 0.5,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '#SO-2001',
                            style: TextStyle(
                              fontFamily: AppTypography.primaryFont,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF181D19),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF3C7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Color(0xFF92400E),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              'Pending',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF92400E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildDivider(),

                  // Customer Name
                  const Text(
                    'Customer Name',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 12,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Acme Construction Co.',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF181D19),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Dates Row
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Order Date',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 12,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '10/30/2023',
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Delivery Date',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 12,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '11/05/2023',
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
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Delivery Address
                  const Text(
                    'Delivery Address',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 12,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '123 Industrial Way, North Basin, CA 90210',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF181D19),
                    ),
                  ),
                  _buildDivider(),

                  // Notes
                  const Text(
                    'Notes',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 12,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Customer requested afternoon delivery.',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Total Amount Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          'Total Amount',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 13,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ),
                      Text(
                        '\$1,250.00',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF006C44),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card 2: Ordered Products
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xB2BDCABF),
                  width: 1.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ordered Products',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF181D19),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Product 1
                  _buildProductRow(
                    name: 'Heavy Duty Drill',
                    qty: 'Qty: 2',
                    price: '\$500.00',
                  ),
                  _buildDivider(),

                  // Product 2
                  _buildProductRow(
                    name: 'Steel Fasteners Box',
                    qty: 'Qty: 5',
                    price: '\$250.00',
                  ),
                  const SizedBox(height: 14),

                  // Summary Box
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F7F4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                              child: Text(
                                'Total Quantity',
                                style: TextStyle(
                                  fontFamily: AppTypography.primaryFont,
                                  fontSize: 13,
                                  color: Color(0xFF4B5563),
                                ),
                              ),
                            ),
                            Text(
                              '7',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF181D19),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                              child: Text(
                                'Grand Total',
                                style: TextStyle(
                                  fontFamily: AppTypography.primaryFont,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF181D19),
                                ),
                              ),
                            ),
                            Text(
                              '\$1,250.00',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF006C44),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Action 1: Edit Sales Order
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () =>
                    Navigator.pushNamed(context, RouteNames.orderDetails),
                icon: const Icon(Icons.edit_outlined, size: 18),
                label: const Text(
                  'Edit Sales Order',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF48A870),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Action 2: Delete Sales Order
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Delete sales order requested'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.delete_outline, size: 18),
                label: const Text(
                  'Delete Sales Order',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFDC2626),
                  side: const BorderSide(color: Color(0xFFDC2626), width: 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Action 3: Back
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(Icons.arrow_back, size: 18),
                label: const Text(
                  'Back',
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
            const SizedBox(height: 10),

            // Action 4: Invoice
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RouteNames.invoiceDetails),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF4B5563),
                  side: const BorderSide(color: Color(0xCCBDCABF), width: 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Invoice',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14.5,
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

  Widget _buildProductRow({
    required String name,
    required String qty,
    required String price,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF181D19),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                qty,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 12,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF181D19),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Color(0xFFE5E7EB),
      ),
    );
  }
}
