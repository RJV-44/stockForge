import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class ProductFilter extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String>? onCategorySelected;

  const ProductFilter({
    super.key,
    this.selectedCategory = 'All',
    this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Power Tools',
      'Hand Tools',
      'Fasteners',
      'Plumbing',
      'Electrical',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) {
          final isSelected = cat == selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(cat),
              selected: isSelected,
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              onSelected: (_) => onCategorySelected?.call(cat),
            ),
          );
        }).toList(),
      ),
    );
  }
}
