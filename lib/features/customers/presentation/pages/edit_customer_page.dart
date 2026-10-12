import 'package:flutter/material.dart';
import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class EditCustomerPage extends StatefulWidget {
  final Map<String, dynamic>? customer;

  const EditCustomerPage({
    super.key,
    this.customer,
  });

  @override
  State<EditCustomerPage> createState() => _EditCustomerPageState();
}

class _EditCustomerPageState extends State<EditCustomerPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _gstController;
  late final TextEditingController _addressController;
  late final TextEditingController _cityController;
  late final TextEditingController _pincodeController;
  String? _selectedState;

  final List<String> _states = [
    'Illinois',
    'California',
    'Texas',
    'New York',
    'Colorado',
    'Washington',
    'Maharashtra',
    'Gujarat',
    'Karnataka',
    'Delhi',
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    final c = widget.customer;
    _nameController = TextEditingController(
      text: (c?['name'] as String?) ?? 'Global Hardware Supplies Ltd',
    );
    _phoneController = TextEditingController(
      text: (c?['phone'] as String?) ?? '+1 (555) 123-4567',
    );
    _emailController = TextEditingController(
      text: (c?['email'] as String?) ?? 'contact@globalhardware.com',
    );
    _gstController = TextEditingController(
      text: (c?['gst'] as String?) ?? 'GSTIN-992144A',
    );
    _addressController = TextEditingController(
      text: (c?['address'] as String?) ?? '742 Evergreen Terrace, Springfield',
    );
    _cityController = TextEditingController(
      text: (c?['location'] as String?) ?? (c?['city'] as String?) ?? 'Chicago',
    );
    _pincodeController = TextEditingController(
      text: (c?['pincode'] as String?) ?? '60601',
    );

    final rawState = (c?['state'] as String?) ?? 'Illinois';
    _selectedState = _states.contains(rawState) ? rawState : _states.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
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

  void _handleUpdate() {
    if (_formKey.currentState?.validate() ?? false) {
      Helpers.showSnackBar(context, 'Customer updated successfully');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6FBF4),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF006C44)),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Edit Customer',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF006C44),
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onNavigationTap,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildFieldLabel('Customer Name *'),
                _buildTextField(
                  controller: _nameController,
                  hintText: 'Enter full name',
                  validator: (v) => Validators.required(v, 'Customer name'),
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
                  hintText: 'example@business.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => Validators.email(v),
                ),
                const SizedBox(height: 14),

                _buildFieldLabel('GST Number / Tax ID'),
                _buildTextField(
                  controller: _gstController,
                  hintText: 'GSTIN-000000A',
                ),
                const SizedBox(height: 14),

                _buildFieldLabel('Address *'),
                _buildTextField(
                  controller: _addressController,
                  hintText: 'Shop/Floor, Building Name, Street',
                  maxLines: 3,
                  validator: (v) => Validators.required(v, 'Address'),
                ),
                const SizedBox(height: 14),

                _buildFieldLabel('City *'),
                _buildTextField(
                  controller: _cityController,
                  hintText: 'e.g. Chicago',
                  validator: (v) => Validators.required(v, 'City'),
                ),
                const SizedBox(height: 14),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFieldLabel('State *'),
                          _buildDropdownField(
                            hintText: 'Select State',
                            value: _selectedState,
                            items: _states,
                            onChanged: (v) => setState(() => _selectedState = v),
                            validator: (v) => v == null ? 'Please select a state' : null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFieldLabel('Pincode / ZIP *'),
                          _buildTextField(
                            controller: _pincodeController,
                            hintText: '60601',
                            keyboardType: TextInputType.number,
                            validator: (v) => Validators.pincode(v),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Update Customer Button
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _handleUpdate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006C44),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Update Customer',
                      style: TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
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
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
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
          fontFamily: AppTypography.primaryFont,
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
      style: const TextStyle(
        fontFamily: AppTypography.primaryFont,
        fontSize: 14,
        color: Color(0xFF181D19),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: AppTypography.primaryFont,
          color: Color(0xFF9CA3AF),
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
          borderSide: const BorderSide(color: Color(0xFF006C44), width: 1.5),
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
      style: const TextStyle(
        fontFamily: AppTypography.primaryFont,
        fontSize: 14,
        color: Color(0xFF181D19),
      ),
      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF3E4942)),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
          borderSide: const BorderSide(color: Color(0xFF006C44), width: 1.5),
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
        style: const TextStyle(
          fontFamily: AppTypography.primaryFont,
          color: Color(0xFF9CA3AF),
          fontSize: 14,
        ),
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 14,
              color: Color(0xFF181D19),
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
