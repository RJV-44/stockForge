import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _selectedRoleFilter = 'All';

  final List<Map<String, dynamic>> _allUsers = [
    {
      'name': 'Eleanor Vance',
      'role': 'Admin',
      'email': 'eleanor.vance@hardware.supply',
      'phone': '+91 0000000000',
      'roleBg': Color(0xFFD1FAE5),
      'roleColor': Color(0xFF065F46),
    },
    {
      'name': 'Julian Thorne',
      'role': 'Manager',
      'email': 'j.thorne@hardware.supply',
      'phone': '+91 0000000000',
      'roleBg': Color(0xFFDBEAFE),
      'roleColor': Color(0xFF1E40AF),
    },
    {
      'name': 'Marcus Chen',
      'role': 'Staff',
      'email': 'm.chen@hardware.supply',
      'phone': '+91 0000000000',
      'roleBg': Color(0xFFF3F4F6),
      'roleColor': Color(0xFF4B5563),
    },
    {
      'name': 'Sarah Miller',
      'role': 'Staff',
      'email': 's.miller@hardware.supply',
      'phone': '+91 0000000000',
      'roleBg': Color(0xFFF3F4F6),
      'roleColor': Color(0xFF4B5563),
    },
    {
      'name': 'Leo Rodriguez',
      'role': 'Staff',
      'email': 'leo.r@hardware.supply',
      'phone': '+91 0000000000',
      'roleBg': Color(0xFFF3F4F6),
      'roleColor': Color(0xFF4B5563),
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

  List<Map<String, dynamic>> get _filteredUsers {
    return _allUsers.where((user) {
      final matchesRole = _selectedRoleFilter == 'All' ||
          user['role'] == _selectedRoleFilter;
      final query = _searchController.text.toLowerCase().trim();
      final matchesSearch = query.isEmpty ||
          (user['name'] as String).toLowerCase().contains(query) ||
          (user['email'] as String).toLowerCase().contains(query);
      return matchesRole && matchesSearch;
    }).toList();
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Filter by Role',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF181D19),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: ['All', 'Admin', 'Manager', 'Staff'].map((role) {
                    final isSelected = _selectedRoleFilter == role;
                    return ChoiceChip(
                      label: Text(role),
                      selected: isSelected,
                      selectedColor: const Color(0xFFD1FAE5),
                      labelStyle: TextStyle(
                        color: isSelected
                            ? const Color(0xFF065F46)
                            : const Color(0xFF4B5563),
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                      onSelected: (selected) {
                        setState(() {
                          _selectedRoleFilter = role;
                        });
                        Navigator.pop(ctx);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final users = _filteredUsers;

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
          'Users',
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
            heroTag: 'addUserFab',
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.rolesPermissions);
            },
            backgroundColor: const Color(0xFF005C3B),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.person_add_alt_1_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 90),
          children: [
            // Search Bar
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
                  hintText: 'Search User',
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
              child: InkWell(
                onTap: _showFilterModal,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFF3CA474),
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.filter_list_rounded,
                        color: Color(0xFF006C44),
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _selectedRoleFilter == 'All'
                            ? 'Filter'
                            : 'Filter: $_selectedRoleFilter',
                        style: const TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF006C44),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // User Cards List
            ...users.map((user) => _buildUserCard(user)),
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard(Map<String, dynamic> user) {
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
          // Top Row: Name and Role Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user['name'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF181D19),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: user['roleBg'] as Color,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  user['role'] as String,
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: user['roleColor'] as Color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Email
          Text(
            user['email'] as String,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 13,
              color: Color(0xFF4B5563),
            ),
          ),
          const SizedBox(height: 6),

          // Phone
          Row(
            children: [
              const Icon(
                Icons.phone_outlined,
                size: 14,
                color: Color(0xFF4B5563),
              ),
              const SizedBox(width: 6),
              Text(
                user['phone'] as String,
                style: const TextStyle(
                  fontFamily: AppTypography.primaryFont,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4B5563),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Divider
          const Divider(
            color: Color(0xFFF3F4F6),
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 10),

          // Action Buttons: View, Edit
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.rolesPermissions);
                },
                child: const Text(
                  'View',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF006C44),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.rolesPermissions);
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280),
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
