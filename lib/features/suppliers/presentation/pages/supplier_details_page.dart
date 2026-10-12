import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class SupplierDetailsPage extends StatefulWidget {
  const SupplierDetailsPage({super.key});

  @override
  State<SupplierDetailsPage> createState() => _SupplierDetailsPageState();
}

class _SupplierDetailsPageState extends State<SupplierDetailsPage> {
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
          'Supplier Details',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF006C44),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: Color(0xFF374151)),
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.addSupplier);
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF374151)),
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
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            // Card 1: Supplier Summary Header Card
            Container(
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
                  Text(
                    'Global Hardware Supplies',
                    style: const TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF181D19),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1FAE5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'ACTIVE',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF065F46),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(
                        Icons.badge_outlined,
                        size: 16,
                        color: Color(0xFF006C44),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'SUP-2024-089',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4B5563),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Icon(
                        Icons.hub_outlined,
                        size: 16,
                        color: Color(0xFF006C44),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Hardware & Fasteners',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 13,
                          color: Color(0xFF4B5563),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Card 2: Contact Information Card
            Container(
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
                  Row(
                    children: const [
                      Icon(
                        Icons.contact_phone_outlined,
                        size: 20,
                        color: Color(0xFF006C44),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Contact Information',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF181D19),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildContactItem(
                    icon: Icons.person_outline_rounded,
                    label: 'Contact Person',
                    value: 'John Doe',
                  ),
                  const SizedBox(height: 12),
                  _buildContactItem(
                    icon: Icons.phone_outlined,
                    label: 'Mobile',
                    value: '+1 555-0123',
                  ),
                  const SizedBox(height: 12),
                  _buildContactItem(
                    icon: Icons.mail_outline_rounded,
                    label: 'Email',
                    value: 'john@globalhardware.com',
                  ),
                  const SizedBox(height: 12),
                  _buildContactItem(
                    icon: Icons.language_rounded,
                    label: 'Website',
                    value: 'www.globalhardware.com',
                  ),
                  const SizedBox(height: 12),
                  _buildContactItem(
                    icon: Icons.location_on_outlined,
                    label: 'Address',
                    value: '123 Industrial Way, Logistics Park',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Card 3: Business Information Card
            Container(
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
                  Row(
                    children: const [
                      Icon(
                        Icons.business_center_outlined,
                        size: 20,
                        color: Color(0xFF006C44),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Business Information',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF181D19),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoGridBox(
                          label: 'GST Number',
                          value: '29AAAAA00\n00A1Z5',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildInfoGridBox(
                          label: 'PAN',
                          value: 'ABCDE1234F',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoGridBox(
                          label: 'Payment Terms',
                          value: 'Net 30',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildInfoGridBox(
                          label: 'Delivery Time',
                          value: '3-5 Days',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoGridBox(
                          label: 'Preferred Payment',
                          value: 'Bank Transfer',
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Section: Products Supplied
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'Products Supplied',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF181D19),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.inventory);
                  },
                  child: const Text(
                    'View Inventory',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF006C44),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Products Supplied Cards Row
            Row(
              children: [
                Expanded(
                  child: _buildProductSuppliedCard(
                    title: 'Steel Rods (12mm)',
                    stock: '500 Units',
                    price: '\$10.00',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildProductSuppliedCard(
                    title: 'Industrial Hex Bo...',
                    stock: '1,200 Units',
                    price: '\$0.45',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Card 4: Performance Summary
            Container(
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
                  const Text(
                    'Performance Summary',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF181D19),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoGridBox(
                          label: 'Total POs',
                          value: '42',
                          valueSize: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildInfoGridBox(
                          label: 'Products',
                          value: '156',
                          valueSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildInfoGridBox(
                    label: 'Total Purchased',
                    value: '\$284,500',
                    valueSize: 22,
                    valueColor: const Color(0xFF006C44),
                  ),
                  const SizedBox(height: 12),
                  _buildInfoGridBox(
                    label: 'Last Order',
                    value: 'Oct 22, 2023',
                    valueSize: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Section: Recent Orders
            const Text(
              'Recent Orders',
              style: TextStyle(
                fontFamily: AppTypography.primaryFont,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF181D19),
              ),
            ),
            const SizedBox(height: 12),

            _buildOrderCard(
              orderId: 'PO-8821',
              subtitle: 'Oct 20 • \$1,200',
              status: 'PENDING',
              statusBg: const Color(0xFFFEF3C7),
              statusColor: const Color(0xFFD97706),
            ),
            const SizedBox(height: 10),
            _buildOrderCard(
              orderId: 'PO-8750',
              subtitle: 'Oct 12 • \$5,400',
              status: 'DELIVERED',
              statusBg: const Color(0xFFD1FAE5),
              statusColor: const Color(0xFF065F46),
            ),
            const SizedBox(height: 10),
            _buildOrderCard(
              orderId: 'PO-8690',
              subtitle: 'Oct 05 • \$2,100',
              status: 'DELIVERED',
              statusBg: const Color(0xFFD1FAE5),
              statusColor: const Color(0xFF065F46),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Icon(
            icon,
            size: 18,
            color: const Color(0xFF006C44),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 11,
                  color: Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF181D19),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoGridBox({
    required String label,
    required String value,
    double valueSize = 14,
    Color valueColor = const Color(0xFF181D19),
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 11,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: valueSize,
              fontWeight: FontWeight.w700,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductSuppliedCard({
    required String title,
    required String stock,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1.0,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image / graphic header
          Container(
            height: 96,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2C3E50), Color(0xFF4CA1AF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AssetConstants.placeholder,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFF1E3A8A),
                      child: const Center(
                        child: Icon(
                          Icons.precision_manufacturing_rounded,
                          color: Colors.white54,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black.withValues(alpha: 0.15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF181D19),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'STOCK',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        stock,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF181D19),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      price,
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 12,
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
    );
  }

  Widget _buildOrderCard({
    required String orderId,
    required String subtitle,
    required String status,
    required Color statusBg,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1.0,
        ),
      ),
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
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 12,
                  color: Color(0xFF6B7280),
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
              color: statusBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontFamily: AppTypography.primaryFont,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
