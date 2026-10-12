import 'package:flutter/material.dart';
import '../../../../core/widgets/app_dropdown.dart';

class ProductSelector extends StatelessWidget {
  final String? selectedProduct;
  final ValueChanged<String?>? onChanged;

  const ProductSelector({super.key, this.selectedProduct, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AppDropdown<String>(
      label: 'Select Product *',
      hint: 'Choose hardware product',
      value: selectedProduct,
      items: const [
        DropdownMenuItem(
          value: 'DW-20V',
          child: Text('DeWalt Cordless Drill 20V'),
        ),
        DropdownMenuItem(
          value: 'ST-HM',
          child: Text('Stanley Claw Hammer 16oz'),
        ),
        DropdownMenuItem(
          value: 'BS-GLM',
          child: Text('Bosch Laser Measure 65ft'),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
