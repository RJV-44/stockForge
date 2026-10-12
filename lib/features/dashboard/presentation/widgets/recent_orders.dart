import 'package:flutter/material.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/router/route_names.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final mockOrders = [
      {
        'id': '#ORD-1092',
        'customer': 'Acme Construction',
        'amount': '\$1,250.00',
        'status': 'Completed',
      },
      {
        'id': '#ORD-1091',
        'customer': 'Metro Builders',
        'amount': '\$820.00',
        'status': 'Processing',
      },
      {
        'id': '#ORD-1090',
        'customer': 'City Hardware',
        'amount': '\$3,140.00',
        'status': 'Completed',
      },
    ];

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Orders',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, RouteNames.orders),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  foregroundColor: AppColors.headingGreen,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('View All', style: TextStyle(fontSize: 12)),
                    Icon(Icons.chevron_right, size: 16),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mockOrders.length,
            separatorBuilder: (_, _) => const Divider(height: 16),
            itemBuilder: (context, index) {
              final order = mockOrders[index];
              return InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, RouteNames.orderDetails),
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order['id']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            order['customer']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            order['amount']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            order['status']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.success,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
