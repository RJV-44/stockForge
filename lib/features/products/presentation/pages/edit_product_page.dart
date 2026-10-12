import 'package:flutter/material.dart';
import '../../../../core/utils/helpers.dart';
import '../widgets/product_form.dart';

class EditProductPage extends StatelessWidget {
  const EditProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: ProductForm(
          initialName: 'DeWalt Cordless Drill 20V',
          initialCategory: 'Power Tools',
          initialBrand: 'DeWalt',
          initialSku: 'DW-20V-MAX',
          initialPurchasePrice: '110.00',
          initialSellingPrice: '149.99',
          initialStock: '35',
          onSubmit: () {
            Helpers.showSnackBar(context, 'Product updated successfully');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
