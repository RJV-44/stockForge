import 'package:flutter/material.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../app/theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String sku;
  final String category;
  final double price;
  final int stock;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.sku,
    required this.category,
    required this.price,
    required this.stock,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.build_circle_outlined,
              color: AppColors.primary,
              size: 30,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'SKU: $sku • $category',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: stock < 10
                      ? AppColors.error.withAlpha(25)
                      : AppColors.success.withAlpha(25),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '$stock in stock',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: stock < 10 ? AppColors.error : AppColors.success,
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
