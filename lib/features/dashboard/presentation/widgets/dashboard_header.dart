import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';

class DashboardHeader extends StatelessWidget {
  final String userName;

  const DashboardHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, $userName', style: AppTypography.headlineMedium),
            const SizedBox(height: 4),
            const Text(
              'Here is the status of your hardware inventory today.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: AppColors.primary.withAlpha(25),
          child: const Icon(Icons.person, color: AppColors.primary),
        ),
      ],
    );
  }
}
