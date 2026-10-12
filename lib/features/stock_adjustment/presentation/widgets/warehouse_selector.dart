import 'package:flutter/material.dart';
import '../../../../core/widgets/app_dropdown.dart';

class WarehouseSelector extends StatelessWidget {
  final String? selectedWarehouse;
  final ValueChanged<String?>? onChanged;

  const WarehouseSelector({super.key, this.selectedWarehouse, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AppDropdown<String>(
      label: 'Select Warehouse *',
      hint: 'Choose warehouse location',
      value: selectedWarehouse,
      items: const [
        DropdownMenuItem(
          value: 'wh-main',
          child: Text('Main Depot Warehouse (Zone A)'),
        ),
        DropdownMenuItem(
          value: 'wh-north',
          child: Text('North Distribution Center (Zone B)'),
        ),
        DropdownMenuItem(
          value: 'wh-south',
          child: Text('South Retail Store (Zone C)'),
        ),
      ],
      onChanged: onChanged,
    );
  }
}
