import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class OrderStatusBadge extends StatelessWidget {
  final String status;

  const OrderStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status.toLowerCase()) {
      case 'completed':
      case 'delivered':
        color = AppColors.success;
        break;
      case 'processing':
      case 'pending':
        color = AppColors.warning;
        break;
      case 'cancelled':
        color = AppColors.error;
        break;
      default:
        color = AppColors.primary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
