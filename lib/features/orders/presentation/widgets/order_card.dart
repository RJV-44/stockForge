import 'package:flutter/material.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../app/theme/app_colors.dart';
import 'order_status_badge.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String customer;
  final String date;
  final double total;
  final String status;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.customer,
    required this.date,
    required this.total,
    required this.status,
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
                orderId,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              OrderStatusBadge(status: status),
            ],
          ),
          const SizedBox(height: 8),
          Text(customer, style: const TextStyle(color: AppColors.textPrimary)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
