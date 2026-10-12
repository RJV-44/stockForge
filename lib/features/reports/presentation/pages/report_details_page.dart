import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import '../widgets/report_table.dart';

class ReportDetailsPage extends StatelessWidget {
  const ReportDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Revenue Report'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download_rounded),
            tooltip: 'Export CSV',
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  'Gross Revenue',
                  '\$42,850.00',
                  AppColors.headingGreen,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMetricCard(
                  'Net Margin',
                  '28.4%',
                  AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Sales Breakdown by Category',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.headingGreen,
            ),
          ),
          const SizedBox(height: 10),
          const ReportTable(),
          const SizedBox(height: 20),
          const Text(
            'Top Performing Items',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.headingGreen,
            ),
          ),
          const SizedBox(height: 10),
          AppCard(
            child: Column(
              children: [
                _buildTopItem(
                  '1. DeWalt Cordless Drill 20V',
                  '184 units sold',
                  '\$27,598.16',
                ),
                const Divider(height: 16),
                _buildTopItem(
                  '2. Stanley Claw Hammer 16oz',
                  '342 units sold',
                  '\$6,327.00',
                ),
                const Divider(height: 16),
                _buildTopItem(
                  '3. Bosch Laser Measure 65ft',
                  '92 units sold',
                  '\$4,508.00',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String label, String value, Color color) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopItem(String name, String volume, String revenue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            const SizedBox(height: 2),
            Text(
              volume,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Text(
          revenue,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.headingGreen,
          ),
        ),
      ],
    );
  }
}
