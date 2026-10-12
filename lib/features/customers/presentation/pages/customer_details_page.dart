import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class CustomerDetailsPage extends StatefulWidget {
  const CustomerDetailsPage({super.key});

  @override
  State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  int _currentIndex = 0;

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
          'Customer Details',
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
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            // Card 1: Customer Details
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFBDCABF), width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildDetailRow(
                    label: 'Customer Name',
                    value: 'Global Hardware Supplies Ltd',
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),
                  _buildDetailRow(
                    label: 'Phone Number',
                    value: '+1 (555) 123-4567',
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),
                  _buildDetailRow(
                    label: 'Email Address',
                    value: 'contact@globalhw.com',
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),
                  _buildDetailRow(
                    label: 'GST Number',
                    value: '22AAAAA0000A1Z5',
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),
                  _buildDetailRow(
                    label: 'Address',
                    value: '123 Industrial Way, Suite 400',
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),
                  // City, State, Pincode row
                  Row(
                    children: [
                      Expanded(
                        child: _buildDetailRow(
                          label: 'City',
                          value: 'Chicago',
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 52,
                        color: const Color(0xFFE5E7EB),
                      ),
                      Expanded(
                        child: _buildDetailRow(
                          label: 'State',
                          value: 'Illinois',
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 52,
                        color: const Color(0xFFE5E7EB),
                      ),
                      Expanded(
                        child: _buildDetailRow(
                          label: 'Pincode',
                          value: '60601',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card 2: Recent Orders
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
                    'Recent Orders',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF181D19),
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildOrderRow(
                    context,
                    orderId: '#ORD-9921',
                    date: '10/24/2023',
                    status: 'Delivered',
                  ),
                  const Divider(
                    height: 24,
                    thickness: 1,
                    color: Color(0xFFE5E7EB),
                  ),
                  _buildOrderRow(
                    context,
                    orderId: '#ORD-9845',
                    date: '10/20/2023',
                    status: 'Delivered',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card 3: Recent Invoices
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
                    'Recent Invoices',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF181D19),
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildInvoiceRow(
                    context,
                    invoiceId: '#INV-8842',
                    date: '10/25/2023',
                    amount: '\$1,250.00',
                  ),
                  const Divider(
                    height: 24,
                    thickness: 1,
                    color: Color(0xFFE5E7EB),
                  ),
                  _buildInvoiceRow(
                    context,
                    invoiceId: '#INV-8810',
                    date: '10/22/2023',
                    amount: '\$840.50',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Button 1: Edit Customer
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.editCustomer,
                  );
                },
                icon: const Icon(Icons.edit_outlined, size: 18),
                label: const Text(
                  'Edit Customer',
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

            // Button 2: Delete Customer
            SizedBox(
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Delete Customer tapped')),
                  );
                },
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  size: 18,
                  color: Color(0xFFBA1A1A),
                ),
                label: const Text(
                  'Delete Customer',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFBA1A1A),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFBA1A1A), width: 1.2),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Button 3: Back
            SizedBox(
              height: 48,
              child: OutlinedButton(
                onPressed: () => Navigator.maybePop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFBDCABF), width: 1.2),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3E4942),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 14.5,
              fontWeight: FontWeight.w700,
              color: Color(0xFF181D19),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderRow(
    BuildContext context, {
    required String orderId,
    required String date,
    required String status,
  }) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RouteNames.orderDetails),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderId,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF181D19),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: const TextStyle(
                fontFamily: AppTypography.primaryFont,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2E7D32),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceRow(
    BuildContext context, {
    required String invoiceId,
    required String date,
    required String amount,
  }) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RouteNames.invoiceDetails),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                invoiceId,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF181D19),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF181D19),
            ),
          ),
        ],
      ),
    );
  }
}
