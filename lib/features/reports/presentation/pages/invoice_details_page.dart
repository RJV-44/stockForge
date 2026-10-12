import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class InvoiceDetailsPage extends StatefulWidget {
  const InvoiceDetailsPage({super.key});

  @override
  State<InvoiceDetailsPage> createState() => _InvoiceDetailsPageState();
}

class _InvoiceDetailsPageState extends State<InvoiceDetailsPage> {
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
          'Invoice Details',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF006C44),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded, color: Color(0xFF006C44)),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onNavigationTap,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            // Card 1: INVOICE INFORMATION
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFBDCABF), width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'INVOICE INFORMATION',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF3E4942),
                          letterSpacing: 0.3,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF3C7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Unpaid',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF92400E),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Invoice Number',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'INV-2023-001',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
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
                              'Date',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Oct 24, 2023',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF181D19),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sales Order ID',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'SO-8921',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF181D19),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card 2: CUSTOMER INFORMATION
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFBDCABF), width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CUSTOMER INFORMATION',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3E4942),
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Icon(
                        Icons.apartment_rounded,
                        size: 18,
                        color: Color(0xFF6B7280),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Industrial Builds Ltd',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF181D19),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(
                        Icons.phone_outlined,
                        size: 18,
                        color: Color(0xFF6B7280),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '+1 (555) 123-4567',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 13.5,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF181D19),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(
                        Icons.mail_outline_rounded,
                        size: 18,
                        color: Color(0xFF6B7280),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'procurement@industrialbuilds.com',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 13.5,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF181D19),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card 3: PURCHASED PRODUCTS
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFBDCABF), width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PURCHASED PRODUCTS',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3E4942),
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildProductItem(
                    name: 'Steel Rods (12mm)',
                    qtyInfo: 'Qty: 100 units • \$10.00 / unit',
                    price: '\$1,000.00',
                  ),
                  const Divider(
                    height: 22,
                    thickness: 1,
                    color: Color(0xFFE5E7EB),
                  ),
                  _buildProductItem(
                    name: 'Heavy Duty Fasteners',
                    qtyInfo: 'Qty: 500 units • \$0.50 / unit',
                    price: '\$250.00',
                  ),
                  const Divider(
                    height: 22,
                    thickness: 1,
                    color: Color(0xFFE5E7EB),
                  ),
                  _buildProductItem(
                    name: 'Concrete Anchors',
                    qtyInfo: 'Qty: 200 units • \$2.25 / unit',
                    price: '\$450.00',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card 4: PAYMENT SUMMARY
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFBDCABF), width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PAYMENT SUMMARY',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3E4942),
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildSummaryLine(label: 'Subtotal', value: '\$1,700.00'),
                  const SizedBox(height: 10),
                  _buildSummaryLine(label: 'Tax (8%)', value: '\$136.00'),
                  const SizedBox(height: 10),
                  _buildSummaryLine(
                    label: 'Discount',
                    value: '-\$0.00',
                    valueColor: const Color(0xFF006C44),
                  ),
                  const Divider(
                    height: 24,
                    thickness: 1,
                    color: Color(0xFFE5E7EB),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          'Grand Total',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF181D19),
                          ),
                        ),
                      ),
                      Text(
                        '\$1,836.00',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF006C44),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Button 1: Mark as Paid
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  Helpers.showSnackBar(context, 'Invoice marked as paid');
                },
                icon: const Icon(Icons.check_circle_outline, size: 20),
                label: const Text(
                  'Mark as Paid',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006C44),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Button 2: Download Invoice
            SizedBox(
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  Helpers.showSnackBar(
                    context,
                    'Invoice downloaded successfully',
                  );
                },
                icon: const Icon(Icons.download_rounded, size: 20),
                label: const Text(
                  'Download Invoice',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF006C44), width: 1.2),
                  foregroundColor: const Color(0xFF006C44),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem({
    required String name,
    required String qtyInfo,
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
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF181D19),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                qtyInfo,
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
        const SizedBox(width: 8),
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

  Widget _buildSummaryLine({
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4B5563),
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: valueColor ?? const Color(0xFF181D19),
          ),
        ),
      ],
    );
  }
}
