import 'package:flutter/material.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFF7FAF7),
        border: Border(
          top: BorderSide(color: Color(0xFFE5E7EB), width: 1.0),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: _buildNavItem(
                  index: 0,
                  label: 'Dashboard',
                  activeIcon: Icons.grid_view_rounded,
                  inactiveIcon: Icons.grid_view_outlined,
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  index: 1,
                  label: 'Products',
                  activeIcon: Icons.inventory_2_rounded,
                  inactiveIcon: Icons.inventory_2_outlined,
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  index: 2,
                  label: 'Orders',
                  activeIcon: Icons.shopping_cart_rounded,
                  inactiveIcon: Icons.shopping_cart_outlined,
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  index: 3,
                  label: 'Reports',
                  activeIcon: Icons.insert_chart_rounded,
                  inactiveIcon: Icons.insert_chart_outlined_rounded,
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  index: 4,
                  label: 'Profile',
                  activeIcon: Icons.person_rounded,
                  inactiveIcon: Icons.person_outline_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String label,
    required IconData activeIcon,
    required IconData inactiveIcon,
  }) {
    final bool isSelected = currentIndex == index;

    if (isSelected) {
      return GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF48A870),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  activeIcon,
                  size: 20,
                  color: const Color(0xFF003D25),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF003D25),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                inactiveIcon,
                size: 20,
                color: const Color(0xFF4B5563),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4B5563),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
