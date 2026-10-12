import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_scaffold.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';
import '../../../../app/router/route_names.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/utils/validators.dart';

class AddSupplierPage extends StatefulWidget {
  const AddSupplierPage({super.key});

  @override
  State<AddSupplierPage> createState() => _AddSupplierPageState();
}

class _AddSupplierPageState extends State<AddSupplierPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _gstController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _pincodeController = TextEditingController();
  String? _selectedState;

  final List<String> _states = [
    'California',
    'New York',
    'Texas',
    'Maharashtra',
    'Delhi',
    'Karnataka',
    'Ontario',
    'London',
  ];

  int _currentIndex = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _contactPersonController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _gstController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _pincodeController.dispose();
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
      Helpers.showSnackBar(context, 'Supplier saved successfully');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Add Supplier',
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
                child: Text(
                  'JS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF475569),
                  ),
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
              _buildFieldLabel('Supplier Name *'),
              _buildTextField(
                controller: _nameController,
                hintText: 'e.g. Acme Hardware Corp',
                validator: (v) => Validators.required(v, 'Supplier name'),
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Contact Person *'),
              _buildTextField(
                controller: _contactPersonController,
                hintText: 'John Doe',
                validator: (v) => Validators.required(v, 'Contact person'),
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Phone Number *'),
              _buildTextField(
                controller: _phoneController,
                hintText: '+1 (555) 000-0000',
                keyboardType: TextInputType.phone,
                validator: (v) => Validators.phone(v, 'Phone number'),
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Email Address *'),
              _buildTextField(
                controller: _emailController,
                hintText: 'contact@supplier.com',
                keyboardType: TextInputType.emailAddress,
                validator: (v) => Validators.email(v),
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('GST Number'),
              _buildTextField(
                controller: _gstController,
                hintText: '22AAAAA0000A1Z5',
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Address *'),
              _buildTextField(
                controller: _addressController,
                hintText: 'Street name, Building No, Area',
                maxLines: 3,
                validator: (v) => Validators.required(v, 'Address'),
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('City *'),
              _buildTextField(
                controller: _cityController,
                hintText: 'City Name',
                validator: (v) => Validators.required(v, 'City'),
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('State *'),
              _buildDropdownField(
                hintText: 'Select State',
                value: _selectedState,
                items: _states,
                onChanged: (v) => setState(() => _selectedState = v),
                validator: (v) => v == null ? 'Please select a state' : null,
              ),
              const SizedBox(height: 14),

              _buildFieldLabel('Pincode *'),
              _buildTextField(
                controller: _pincodeController,
                hintText: '123456',
                keyboardType: TextInputType.number,
                validator: (v) => Validators.pincode(v),
              ),
              const SizedBox(height: 24),

              // Save Supplier Button
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
                    'Save Supplier',
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
