import 'package:flutter/material.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_dropdown.dart';
import '../../../../core/utils/helpers.dart';
import '../widgets/product_selector.dart';
import '../widgets/warehouse_selector.dart';
import '../widgets/quantity_field.dart';
import '../widgets/adjustment_reason_field.dart';

class StockAdjustmentPage extends StatefulWidget {
  const StockAdjustmentPage({super.key});

  @override
  State<StockAdjustmentPage> createState() => _StockAdjustmentPageState();
}

class _StockAdjustmentPageState extends State<StockAdjustmentPage> {
  final _formKey = GlobalKey<FormState>();
  final _qtyController = TextEditingController();
  final _reasonController = TextEditingController();
  String? _selectedProduct = 'DW-20V';
  String? _selectedWarehouse = 'wh-main';
  String? _selectedAdjustmentType = 'add';

  final List<DropdownMenuItem<String>> _adjustmentTypes = const [
    DropdownMenuItem(value: 'add', child: Text('Stock In / Addition (+)')),
    DropdownMenuItem(value: 'deduct', child: Text('Stock Out / Deduction (-)')),
    DropdownMenuItem(value: 'damaged', child: Text('Damaged / Write-Off (-)')),
    DropdownMenuItem(
      value: 'audit',
      child: Text('Inventory Count Correction (=)'),
    ),
  ];

  @override
  void dispose() {
    _qtyController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      Helpers.showSnackBar(context, 'Stock adjusted successfully');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stock Adjustment')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductSelector(
                selectedProduct: _selectedProduct,
                onChanged: (v) => setState(() => _selectedProduct = v),
              ),
              const SizedBox(height: 14),
              WarehouseSelector(
                selectedWarehouse: _selectedWarehouse,
                onChanged: (v) => setState(() => _selectedWarehouse = v),
              ),
              const SizedBox(height: 14),
              AppDropdown<String>(
                label: 'Adjustment Type *',
                hint: 'Select adjustment type',
                value: _selectedAdjustmentType,
                items: _adjustmentTypes,
                onChanged: (v) => setState(() => _selectedAdjustmentType = v),
                validator: (v) =>
                    v == null ? 'Please select an adjustment type' : null,
              ),
              const SizedBox(height: 14),
              QuantityField(controller: _qtyController),
              const SizedBox(height: 14),
              AdjustmentReasonField(controller: _reasonController),
              const SizedBox(height: 24),
              AppButton(text: 'Apply Adjustment', onPressed: _handleSubmit),
            ],
          ),
        ),
      ),
    );
  }
}
