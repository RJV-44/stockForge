import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_scaffold.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';
import '../../../../app/router/route_names.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/utils/validators.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  final _formKey = GlobalKey<FormState>();
  final _orderDateController = TextEditingController(text: '10/27/2023');
  final _deliveryDateController = TextEditingController();
  final _quantityController = TextEditingController(text: '0');
  final _unitPriceController = TextEditingController(text: '0.00');
  final _notesController = TextEditingController();

  String? _selectedSupplier;
  String? _selectedProduct;

  final List<String> _suppliers = [
    'Acme Hardware Corp',
    'Apex Logistics LLC',
    'Metro Tools Direct',
    'National Fasteners Co',
  ];

  final List<String> _products = [
    'DeWalt Cordless Drill 20V',
    'Stanley Claw Hammer 16oz',
    'Bosch Laser Measure 65ft',
    'Heavy Duty Angle Grinder',
  ];

  int _currentIndex = 2;

  @override
  void dispose() {
    _orderDateController.dispose();
    _deliveryDateController.dispose();
    _quantityController.dispose();
    _unitPriceController.dispose();
    _notesController.dispose();
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
      Helpers.showSnackBar(context, 'Purchase order saved successfully');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Create Purchase Order',
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Center(
            child: Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                color: Color(0xFFE2E8F0),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.person_outline_rounded,
                  color: Color(0xFF475569),
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
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
              _buildFieldLabel('Supplier *'),
              _buildDropdownField(
                hintText: 'Select Supplier',
                value: _selectedSupplier,
                items: _suppliers,
                onChanged: (v) => setState(() => _selectedSupplier = v),
                validator: (v) => v == null ? 'Please select a supplier' : null,
              ),
              const SizedBox(height: 14),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('Order Date *'),
                        _buildTextField(
                          controller: _orderDateController,
                          hintText: '10/27/2023',
                          validator: (v) => Validators.required(v, 'Order date'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('Delivery Date *'),
                        _buildTextField(
                          controller: _deliveryDateController,
                          hintText: 'mm/dd/yyyy',
                          validator: (v) => Validators.required(v, 'Delivery date'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Product *'),
              _buildProductDropdownField(
                hintText: 'Select Product',
                value: _selectedProduct,
                items: _products,
                onChanged: (v) => setState(() => _selectedProduct = v),
                validator: (v) => v == null ? 'Please select a product' : null,
              ),
              const SizedBox(height: 14),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('Quantity *'),
                        _buildTextField(
                          controller: _quantityController,
                          hintText: '0',
                          keyboardType: TextInputType.number,
                          validator: (v) => Validators.positiveNumber(v, 'Quantity'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel('Unit Price (\$) *'),
                        _buildTextField(
                          controller: _unitPriceController,
                          hintText: '0.00',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          validator: (v) => Validators.positiveNumber(v, 'Unit price'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Notes'),
              _buildTextField(
                controller: _notesController,
                hintText: 'Additional requirements or shipping instructions...',
                maxLines: 4,
              ),
              const SizedBox(height: 24),

              // Save Purchase Order Button with save icon
              SizedBox(
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _handleSave,
                  icon: const Icon(Icons.save_outlined, size: 20),
                  label: const Text(
                    'Save Purchase Order',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF48A870),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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

  Widget _buildProductDropdownField({
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
      icon: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.keyboard_arrow_down, color: Color(0xFF6B7280)),
          SizedBox(width: 4),
          Icon(Icons.all_inbox_rounded, color: Color(0xFF181D19), size: 20),
        ],
      ),
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
