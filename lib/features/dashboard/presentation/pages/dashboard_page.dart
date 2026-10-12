import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  void _onNavigationTap(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    switch (index) {
      case 0:
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
      backgroundColor: const Color(0xFFF9FBF9),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar Header
            _buildTopHeader(),

            // Main Scrollable Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                children: [
                  // 1. Purchase Management, Customers, Invoices, and Suppliers Overview Cards
                  _buildOverviewCards(),
                  const SizedBox(height: 18),

                  // 2. Low Stock Alerts
                  _buildLowStockAlertsSection(),
                  const SizedBox(height: 18),

                  // 3. Sales Overview Chart Card
                  _buildSalesOverviewSection(),
                  const SizedBox(height: 18),

                  // 4. Recent Orders
                  _buildRecentOrdersSection(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onNavigationTap,
      ),
    );
  }

  Widget _buildTopHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: const Color(0xFFF9FBF9),
      child: Row(
        children: [
          // User Avatar
          CircleAvatar(
            radius: 19,
            backgroundColor: const Color(0xFFE2E8F0),
            backgroundImage: const AssetImage(AssetConstants.userAvatar),
            child: ClipOval(
              child: Image.asset(
                AssetConstants.userAvatar,
                width: 38,
                height: 38,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person_rounded,
                    color: Color(0xFF475569),
                    size: 22,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 10),

          // User Greeting & Name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Good Morning,',
                style: TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B7280),
                ),
              ),
              SizedBox(height: 1),
              Text(
                'Khush Dobariya',
                style: TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF181D19),
                ),
              ),
            ],
          ),

          const Spacer(),

          // Search Action Button
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              color: Color(0xFF181D19),
              size: 23,
            ),
            splashRadius: 20,
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.products);
            },
          ),

          // Notification Bell Button
          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xFF181D19),
              size: 23,
            ),
            splashRadius: 20,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCards() {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Purchase Management',
                  value: '24',
                  icon: Icons.shopping_bag_rounded,
                  iconBgColor: const Color(0xFFE0F2FE),
                  iconColor: const Color(0xFF0284C7),
                  onTap: () => Navigator.pushNamed(context, RouteNames.purchaseOrders),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Customers',
                  value: '1,248',
                  icon: Icons.group_rounded,
                  iconBgColor: const Color(0xFFE8F5E9),
                  iconColor: const Color(0xFF006C44),
                  onTap: () => Navigator.pushNamed(context, RouteNames.customers),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _buildStatCard(
                  title: 'Invoices',
                  value: '356',
                  icon: Icons.receipt_long_rounded,
                  iconBgColor: const Color(0xFFFEF3C7),
                  iconColor: const Color(0xFFB45309),
                  onTap: () => Navigator.pushNamed(context, RouteNames.invoices),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  title: 'Suppliers',
                  value: '86',
                  icon: Icons.business_rounded,
                  iconBgColor: const Color(0xFFF3E8FF),
                  iconColor: const Color(0xFF7E22CE),
                  onTap: () => Navigator.pushNamed(context, RouteNames.suppliers),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE5E7EB), width: 1.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: AppTypography.primaryFont,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontFamily: AppTypography.primaryFont,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF181D19),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLowStockAlertsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Low Stock Alerts',
              style: TextStyle(
                fontFamily: AppTypography.primaryFont,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF181D19),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, RouteNames.inventory),
              child: const Text(
                'View All',
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
        const SizedBox(height: 10),
        _buildLowStockCard(
          title: 'Galvanized Steel Pipe 2"',
          stock: '12',
          min: '50',
        ),
        const SizedBox(height: 8),
        _buildLowStockCard(
          title: 'Industrial Drill Bit Set',
          stock: '8',
          min: '25',
        ),
      ],
    );
  }

  Widget _buildLowStockCard({
    required String title,
    required String stock,
    required String min,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF181D19),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Stock: $stock   Min: $min',
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFDE8E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Low Stock',
              style: TextStyle(
                fontFamily: AppTypography.primaryFont,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF991B1B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalesOverviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sales Overview',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF181D19),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 140,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1.0),
          ),
          child: CustomPaint(
            size: Size.infinite,
            painter: _SalesChartPainter(),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentOrdersSection() {
    return Column(
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
        const SizedBox(height: 10),
        _buildRecentOrderCard(
          orderId: 'ORD-8821',
          customerName: 'Metro Buildcon Ltd.',
          statusText: 'Completed',
          statusColor: Colors.white,
          statusBgColor: const Color(0xFF2E7D32),
          amount: '₹12,450',
          date: 'Oct 24, 2023',
        ),
        const SizedBox(height: 8),
        _buildRecentOrderCard(
          orderId: 'ORD-8822',
          customerName: 'RK Infrastructure',
          statusText: 'Pending',
          statusColor: const Color(0xFF92400E),
          statusBgColor: const Color(0xFFFEF3C7),
          amount: '₹4,200',
          date: 'Oct 24, 2023',
        ),
        const SizedBox(height: 8),
        _buildRecentOrderCard(
          orderId: 'ORD-8823',
          customerName: 'Sunshine Hardware',
          statusText: 'Processing',
          statusColor: const Color(0xFF0369A1),
          statusBgColor: const Color(0xFFE0F2FE),
          amount: '₹8,760',
          date: 'Oct 23, 2023',
        ),
      ],
    );
  }

  Widget _buildRecentOrderCard({
    required String orderId,
    required String customerName,
    required String statusText,
    required Color statusColor,
    required Color statusBgColor,
    required String amount,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
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
                      customerName,
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF3F4F6)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  amount,
                  style: const TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF181D19),
                  ),
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SalesChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = const Color(0xFFBDCABF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      borderPaint,
    );

    final linePaint = Paint()
      ..color = const Color(0xFFE05353)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final fillPaint = Paint()
      ..color = const Color(0x33E05353)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);

    path.cubicTo(
      size.width * 0.15,
      size.height * 0.65,
      size.width * 0.22,
      size.height * 0.38,
      size.width * 0.28,
      size.height * 0.42,
    );
    path.cubicTo(
      size.width * 0.35,
      size.height * 0.48,
      size.width * 0.42,
      size.height * 0.22,
      size.width * 0.52,
      size.height * 0.20,
    );
    path.cubicTo(
      size.width * 0.62,
      size.height * 0.18,
      size.width * 0.68,
      size.height * 0.50,
      size.width * 0.75,
      size.height * 0.48,
    );
    path.cubicTo(
      size.width * 0.82,
      size.height * 0.46,
      size.width * 0.88,
      size.height * 0.40,
      size.width,
      0,
    );

    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
