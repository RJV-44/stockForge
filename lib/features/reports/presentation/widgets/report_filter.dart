import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class ReportFilter extends StatelessWidget {
  const ReportFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Chip(
            label: const Text('Today'),
            backgroundColor: AppColors.primary.withAlpha(25),
          ),
          const SizedBox(width: 8),
          const Chip(label: Text('This Week')),
          const SizedBox(width: 8),
          const Chip(label: Text('This Month')),
          const SizedBox(width: 8),
          const Chip(label: Text('Custom Range')),
        ],
      ),
    );
  }
}
