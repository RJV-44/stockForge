import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _customers = [
    {
      'name': 'Global Hardware Supplies Ltd',
      'phone': '+1 (555) 123-4567',
      'email': 'contact@globalhardware.com',
      'location': 'Chicago',
    },
    {
      'name': 'Acme Construction Co.',
      'phone': '+1 (555) 987-6543',
      'email': 'billing@acmebuilds.net',
      'location': 'Denver',
    },
    {
      'name': 'Precision Tools & Co.',
      'phone': '+1 (555) 246-8101',
      'email': 'sales@precisiontools.io',
      'location': 'Seattle',
    },
    {
      'name': 'Metropolis Supply Group',
      'phone': '+1 (555) 369-1215',
      'email': 'support@metrogroup.com',
      'location': 'New York City',
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

  List<Map<String, dynamic>> get _filteredCustomers {
    final query = _searchController.text.toLowerCase().trim();
    if (query.isEmpty) return _customers;
    return _customers.where((c) {
      return (c['name'] as String).toLowerCase().contains(query) ||
          (c['location'] as String).toLowerCase().contains(query) ||
          (c['email'] as String).toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final customers = _filteredCustomers;

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
          'Customers',
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
          width: 52,
          height: 52,
          child: FloatingActionButton(
            heroTag: 'addCustomerFab',
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.addCustomer);
            },
            backgroundColor: const Color(0xFF3CA474),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 90),
          children: [
            // Search Customer Field
            Container(
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
                  hintText: 'Search Customer',
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
            const SizedBox(height: 14),

            // Filter Button
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF6B7280),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.filter_list_rounded,
                      color: Color(0xFF181D19),
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF181D19),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Customer Cards
            ...customers.map((customer) => _buildCustomerCard(customer)),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerCard(Map<String, dynamic> customer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F7F4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Text(
            customer['name'] as String,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF181D19),
            ),
          ),
          const SizedBox(height: 10),

          // Phone
          Row(
            children: [
              const Icon(
                Icons.phone_outlined,
                size: 14,
                color: Color(0xFF4B5563),
              ),
              const SizedBox(width: 8),
              Text(
                customer['phone'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 13,
                  color: Color(0xFF4B5563),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Email
          Row(
            children: [
              const Icon(
                Icons.mail_outline_rounded,
                size: 14,
                color: Color(0xFF4B5563),
              ),
              const SizedBox(width: 8),
              Text(
                customer['email'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 13,
                  color: Color(0xFF4B5563),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Location
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 14,
                color: Color(0xFF4B5563),
              ),
              const SizedBox(width: 8),
              Text(
                customer['location'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 13,
                  color: Color(0xFF4B5563),
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

          // Action Buttons: View & Edit
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.customerDetails,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3CA474),
                      foregroundColor: Colors.white,
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
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.editCustomer,
                        arguments: customer,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8ECE9),
                      foregroundColor: const Color(0xFF374151),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF374151),
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
