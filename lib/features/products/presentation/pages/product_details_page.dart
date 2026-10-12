import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _currentIndex = 1;

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
          'Product Details',
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
            // Card 1: Purchase Order Information
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
                  // Row: ID & Completed Badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Purchase Order ID',
                            style: TextStyle(
                              fontFamily: AppTypography.primaryFont,
                              fontSize: 12,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '#PO-1024',
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
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Completed',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildDivider(),

                  // Supplier Name
                  const Text(
                    'Supplier Name',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 12,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Global Hardware Solutions',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
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
                              '10/26/2023',
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
                              'Expected Delivery',
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
                  _buildDivider(),

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
                        '\$4,250.00',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF006C44),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

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
                    'Priority delivery requested for warehouse restocking.',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF4B5563),
                    ),
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

                  // Item 1
                  _buildOrderItem(
                    name: 'Heavy Duty Drill',
                    qtyPrice: 'Qty: 10 × \$250.00',
                    total: '\$2,500.00',
                  ),
                  const SizedBox(height: 14),

                  // Item 2
                  _buildOrderItem(
                    name: 'Steel Fasteners Box',
                    qtyPrice: 'Qty: 50 × \$35.00',
                    total: '\$1,750.00',
                  ),
                  const SizedBox(height: 14),

                  // Dashed divider line
                  Row(
                    children: List.generate(
                      40,
                      (index) => Expanded(
                        child: Container(
                          color: index.isEven
                              ? const Color(0xFFBDCABF)
                              : Colors.transparent,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Total Quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          'Total Quantity',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 13.5,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF181D19),
                          ),
                        ),
                      ),
                      Text(
                        '60',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 14.5,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF181D19),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Grand Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          'Grand Total',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF181D19),
                          ),
                        ),
                      ),
                      Text(
                        '\$4,250.00',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF006C44),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Action 1: Edit Purchase Order
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RouteNames.orderDetails),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006C44),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Edit Purchase Order',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Action 2: Delete Purchase Order
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Delete purchase order requested'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFDC2626),
                  side: const BorderSide(color: Color(0xFFDC2626), width: 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Delete Purchase Order',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Action 3: Back
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () => Navigator.maybePop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF4B5563),
                  side: const BorderSide(color: Color(0xCCBDCABF), width: 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Back',
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

  Widget _buildOrderItem({
    required String name,
    required String qtyPrice,
    required String total,
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
                qtyPrice,
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
          total,
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
