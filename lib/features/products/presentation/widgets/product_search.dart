import 'package:flutter/material.dart';
import '../../../../core/widgets/app_text_field.dart';

class ProductSearch extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const ProductSearch({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hint: 'Search products by name, SKU...',
      prefixIcon: const Icon(Icons.search),
      validator: (_) => null,
    );
  }
}
