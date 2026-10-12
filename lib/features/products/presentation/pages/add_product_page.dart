import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_scaffold.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';
import '../../../../app/router/route_names.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/utils/validators.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _skuController = TextEditingController();
  final _purchasePriceController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _stockController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedCategory;
  String? _selectedSupplier;

  final List<String> _categories = [
    'Power Tools',
    'Hand Tools',
    'Fasteners & Screws',
    'Plumbing & Pipes',
    'Electrical & Lighting',
    'Safety & PPE',
    'Building Materials',
  ];

  final List<String> _suppliers = [
    'Acme Hardware Corp',
    'Apex Logistics LLC',
    'Metro Tools Direct',
    'National Fasteners Co',
  ];

  int _currentIndex = 1;

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _skuController.dispose();
    _purchasePriceController.dispose();
    _sellingPriceController.dispose();
    _stockController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onNavigationTap(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, RouteNames.dashboard);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, RouteNames.products);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, RouteNames.orders);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, RouteNames.reports);
        break;
      case 4:
        Navigator.pushReplacementNamed(context, RouteNames.profile);
        break;
    }
  }

  void _handleSave() {
    if (_formKey.currentState?.validate() ?? false) {
      Helpers.showSnackBar(context, 'Product saved successfully');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Add Product',
      titleColor: const Color(0xFF181D19),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onNavigationTap,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildFieldLabel('Product Name *'),
              _buildTextField(
                controller: _nameController,
                hintText: 'Enter product name',
                validator: (v) => Validators.required(v, 'Product name'),
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Category *'),
              _buildDropdownField(
                hintText: 'Select Category',
                value: _selectedCategory,
                items: _categories,
                onChanged: (v) => setState(() => _selectedCategory = v),
                validator: (v) => v == null ? 'Please select a category' : null,
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Brand *'),
              _buildTextField(
                controller: _brandController,
                hintText: 'Enter brand name',
                validator: (v) => Validators.required(v, 'Brand'),
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('SKU *'),
              _buildTextField(
                controller: _skuController,
                hintText: 'E.g. HW-99012',
                validator: (v) => Validators.required(v, 'SKU'),
              ),
              const SizedBox(height: 14),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('Purchase Price *'),
                        _buildTextField(
                          controller: _purchasePriceController,
                          hintText: '0.00',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          validator: (v) => Validators.positiveNumber(v, 'Purchase price'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('Selling Price *'),
                        _buildTextField(
                          controller: _sellingPriceController,
                          hintText: '0.00',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          validator: (v) => Validators.positiveNumber(v, 'Selling price'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Stock Quantity *'),
              _buildTextField(
                controller: _stockController,
                hintText: '0',
                keyboardType: TextInputType.number,
                validator: (v) => Validators.number(v, 'Stock quantity'),
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Supplier *'),
              _buildDropdownField(
                hintText: 'Select Supplier',
                value: _selectedSupplier,
                items: _suppliers,
                onChanged: (v) => setState(() => _selectedSupplier = v),
                validator: (v) => v == null ? 'Please select a supplier' : null,
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Description'),
              _buildTextField(
                controller: _descriptionController,
                hintText: 'Enter product details...',
                maxLines: 3,
              ),
              const SizedBox(height: 24),

              // Save Product Button
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _handleSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF48A870),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save Product',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Cancel Button
              SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF3E4942),
                    side: const BorderSide(color: Color(0xFFBDCABF), width: 1.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w700,
          color: Color(0xFF181D19),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(fontSize: 14, color: Color(0xFF181D19)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF8A948D)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFBDCABF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFBDCABF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF48A870), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDC2626), width: 1.2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDC2626), width: 1.5),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String hintText,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      isExpanded: true,
      validator: validator,
      style: const TextStyle(fontSize: 14, color: Color(0xFF181D19)),
      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF6B7280)),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFBDCABF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFBDCABF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF48A870), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDC2626), width: 1.2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDC2626), width: 1.5),
        ),
      ),
      hint: Text(
        hintText,
        style: const TextStyle(fontSize: 14, color: Color(0xFF8A948D)),
      ),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
