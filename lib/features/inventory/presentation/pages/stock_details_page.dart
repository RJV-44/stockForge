import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/router/route_names.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_button.dart';

class StockDetailsPage extends StatelessWidget {
  const StockDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Warehouse Stock Details')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Main Depot (Zone A)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.headingGreen,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.success.withAlpha(25),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Operational',
                        style: TextStyle(
                          color: AppColors.success,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Location: Bay 4, Logistics Boulevard',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const Divider(height: 24),
                _buildInfoRow('Total Stock Units', '1,420 units'),
                const SizedBox(height: 8),
                _buildInfoRow('Available Units', '1,340 units'),
                const SizedBox(height: 8),
                _buildInfoRow('Reserved / In Transit', '80 units'),
                const SizedBox(height: 8),
                _buildInfoRow('Low Stock Items', '14 SKUs', isAlert: true),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Inventory Distribution by Aisle',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.headingGreen,
            ),
          ),
          const SizedBox(height: 10),
          _buildAisleItem('Aisle 1 - Power Tools', '320 items', '92% full'),
          const SizedBox(height: 8),
          _buildAisleItem(
            'Aisle 2 - Hand Tools & Fasteners',
            '640 items',
            '78% full',
          ),
          const SizedBox(height: 8),
          _buildAisleItem(
            'Aisle 3 - Plumbing & Electrical',
            '460 items',
            '84% full',
          ),
          const SizedBox(height: 24),
          AppButton(
            text: 'Perform Stock Adjustment',
            onPressed: () =>
                Navigator.pushNamed(context, RouteNames.stockAdjustment),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isAlert = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: isAlert ? AppColors.error : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildAisleItem(String name, String count, String capacity) {
    return AppCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(
                count,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Text(
            capacity,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
