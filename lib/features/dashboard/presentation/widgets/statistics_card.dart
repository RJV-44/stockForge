import 'package:flutter/material.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../app/theme/app_colors.dart';

class StatisticsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String? trend;
  final VoidCallback? onTap;

  const StatisticsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.color = AppColors.primary,
    this.trend,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              CircleAvatar(
                radius: 16,
                backgroundColor: color.withAlpha(25),
                child: Icon(icon, size: 18, color: color),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          if (trend != null) ...[
            const SizedBox(height: 6),
            Text(
              trend!,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.success,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
