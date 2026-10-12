import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({super.key});

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  int _currentIndex = 2; // Orders highlighted per Figma screenshot
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _invoices = [
    {
      'id': '#INV-5001',
      'customer': 'Acme Construction',
      'date': '10/30/2023',
      'amount': '\$1,250.00',
      'status': 'Paid',
      'statusBg': Color(0xFFD1FAE5),
      'statusColor': Color(0xFF065F46),
    },
    {
      'id': '#INV-5002',
      'customer': 'BuildRight Co.',
      'date': '11/02/2023',
      'amount': '\$3,420.50',
      'status': 'Pending',
      'statusBg': Color(0xFFFEF3C7),
      'statusColor': Color(0xFFD97706),
    },
    {
      'id': '#INV-4998',
      'customer': 'Smith & Sons',
      'date': '10/15/2023',
      'amount': '\$890.00',
      'status': 'Overdue',
      'statusBg': Color(0xFFFEE2E2),
      'statusColor': Color(0xFFDC2626),
    },
    {
      'id': '#INV-5003',
      'customer': 'Iron Works Ltd.',
      'date': '11/05/2023',
      'amount': '\$12,000.00',
      'status': 'Paid',
      'statusBg': Color(0xFFD1FAE5),
      'statusColor': Color(0xFF065F46),
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

  List<Map<String, dynamic>> get _filteredInvoices {
    final query = _searchController.text.toLowerCase().trim();
    if (query.isEmpty) return _invoices;
    return _invoices.where((inv) {
      return (inv['id'] as String).toLowerCase().contains(query) ||
          (inv['customer'] as String).toLowerCase().contains(query) ||
          (inv['status'] as String).toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final invoices = _filteredInvoices;

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
          'Invoices',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF006C44),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF006C44)),
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
            // Search and Filter row
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (val) => setState(() {}),
                      decoration: const InputDecoration(
                        hintText: 'Search Invoice',
                        hintStyle: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 14,
                          color: Color(0xFF9CA3AF),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF6B7280),
                          size: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFD1D5DB)),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.tune_rounded,
                      color: Color(0xFF4B5563),
                      size: 22,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Invoices Cards List
            ...invoices.map((inv) => _buildInvoiceCard(inv)),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoiceCard(Map<String, dynamic> inv) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
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
          // Top Row: ID & Status Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                inv['id'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: inv['statusBg'] as Color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  inv['status'] as String,
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: inv['statusColor'] as Color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Customer
          Text(
            inv['customer'] as String,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF181D19),
            ),
          ),
          const SizedBox(height: 6),

          // Date and Amount Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                inv['date'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 13,
                  color: Color(0xFF6B7280),
                ),
              ),
              Text(
                inv['amount'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF006C44),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Divider
          const Divider(
            color: Color(0xFFE5E7EB),
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 14),

          // Action Buttons: View & Download
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.invoiceDetails,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEFF6FF),
                      foregroundColor: const Color(0xFF2563EB),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'View',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Downloading ${inv['id']}...'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.download_rounded,
                      size: 16,
                      color: Color(0xFF2563EB),
                    ),
                    label: const Text(
                      'Download',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEFF6FF),
                      foregroundColor: const Color(0xFF2563EB),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
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
