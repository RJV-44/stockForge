import 'package:flutter/material.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_dropdown.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/utils/validators.dart';

class ProductForm extends StatefulWidget {
  final String? initialName;
  final String? initialCategory;
  final String? initialBrand;
  final String? initialSku;
  final String? initialPurchasePrice;
  final String? initialSellingPrice;
  final String? initialStock;
  final VoidCallback? onSubmit;

  const ProductForm({
    super.key,
    this.initialName,
    this.initialCategory,
    this.initialBrand,
    this.initialSku,
    this.initialPurchasePrice,
    this.initialSellingPrice,
    this.initialStock,
    this.onSubmit,
  });

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _brandController;
  late final TextEditingController _skuController;
  late final TextEditingController _purchasePriceController;
  late final TextEditingController _sellingPriceController;
  late final TextEditingController _stockController;
  String? _selectedCategory;

  final List<String> _categories = [
    'Power Tools',
    'Hand Tools',
    'Fasteners & Screws',
    'Plumbing & Pipes',
    'Electrical & Lighting',
    'Safety & PPE',
    'Building Materials',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _brandController = TextEditingController(text: widget.initialBrand);
    _skuController = TextEditingController(text: widget.initialSku);
    _purchasePriceController = TextEditingController(
      text: widget.initialPurchasePrice,
    );
    _sellingPriceController = TextEditingController(
      text: widget.initialSellingPrice,
    );
    _stockController = TextEditingController(text: widget.initialStock);
    _selectedCategory = widget.initialCategory ?? _categories.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _skuController.dispose();
    _purchasePriceController.dispose();
    _sellingPriceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            label: 'Product Name *',
            hint: 'e.g. Cordless Impact Driver 20V',
            controller: _nameController,
            validator: (v) => Validators.required(v, 'Product Name'),
          ),
          const SizedBox(height: 14),
          AppDropdown<String>(
            label: 'Category *',
            hint: 'Select category',
            value: _selectedCategory,
            items: _categories
                .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                .toList(),
            onChanged: (v) => setState(() => _selectedCategory = v),
            validator: (v) => v == null ? 'Please select a category' : null,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  label: 'Brand *',
                  hint: 'e.g. DeWalt, Bosch',
                  controller: _brandController,
                  validator: (v) => Validators.required(v, 'Brand'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppTextField(
                  label: 'SKU / Barcode *',
                  hint: 'e.g. DW-IMP-20V',
                  controller: _skuController,
                  validator: (v) => Validators.required(v, 'SKU / Barcode'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  label: 'Purchase Price (\$) *',
                  hint: '0.00',
                  controller: _purchasePriceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (v) =>
                      Validators.positiveNumber(v, 'Purchase Price'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppTextField(
                  label: 'Selling Price (\$) *',
                  hint: '0.00',
                  controller: _sellingPriceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (v) =>
                      Validators.positiveNumber(v, 'Selling Price'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          AppTextField(
            label: 'Stock Quantity *',
            hint: 'e.g. 50',
            controller: _stockController,
            keyboardType: TextInputType.number,
            validator: (v) => Validators.number(v, 'Stock Quantity'),
          ),
          const SizedBox(height: 24),
          AppButton(
            text: 'Save Product',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                widget.onSubmit?.call();
              }
            },
          ),
        ],
      ),
    );
  }
}
