import 'package:flutter/material.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../core/utils/helpers.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  String? _selectedSupplier = 'Acme Industrial Supply';
  final _issueDateController = TextEditingController(text: '05/15/2024');
  final _expectedDeliveryController = TextEditingController(text: '05/30/2024');

  final List<String> _suppliers = [
    'Acme Industrial Supply',
    'Apex Logistics LLC',
    'Metro Tools Direct',
    'National Fasteners Co',
  ];

  final List<Map<String, String>> _lineItems = [
    {
      'product': 'Industrial Steel Bearings (Model X)',
      'sku': 'BRG-X-109',
    },
    {
      'product': 'Heavy Duty Lubricant 5Gal',
      'sku': 'LUB-HD-5G',
    },
  ];

  @override
  void dispose() {
    _issueDateController.dispose();
    _expectedDeliveryController.dispose();
    super.dispose();
  }

  void _handleSaveChanges() {
    Helpers.showSnackBar(context, 'Purchase order changes saved successfully');
    Navigator.maybePop(context);
  }

  void _handleSaveDraft() {
    Helpers.showSnackBar(context, 'Draft saved successfully');
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
          icon: const Icon(Icons.arrow_back, color: Color(0xFF181D19)),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Edit Purchase Order',
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF006C44),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_outlined, color: Color(0xFF006C44)),
            tooltip: 'Save',
            onPressed: _handleSaveChanges,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF181D19)),
            tooltip: 'More',
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFE5E7EB), width: 1.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              TextButton(
                onPressed: () => Navigator.maybePop(context),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF3E4942),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _handleSaveDraft,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDCE8FE),
                  foregroundColor: const Color(0xFF1E40AF),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Save\nDraft',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: _handleSaveChanges,
                icon: const Icon(Icons.save_outlined, size: 18),
                label: const Text(
                  'Save\nChanges',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: AppTypography.primaryFont,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006C44),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            // Card 1: PO Details
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFBDCABF), width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PO NUMBER',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6B7280),
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'PO-2024-8991',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF181D19),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Badges Row
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.check_circle,
                              size: 13,
                              color: Color(0xFF2E7D32),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Approved',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2E7D32),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF3C7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.payments_outlined,
                              size: 13,
                              color: Color(0xFF92400E),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Partially Paid',
                              style: TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF92400E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 24,
                    thickness: 1,
                    color: Color(0xFFE5E7EB),
                  ),

                  // Supplier
                  _buildLabel('Supplier *'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedSupplier,
                      isExpanded: true,
                      style: const TextStyle(
                        fontFamily: AppTypography.primaryFont,
                        fontSize: 14,
                        color: Color(0xFF181D19),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF6B7280),
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFBDCABF),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFFBDCABF),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF006C44),
                            width: 1.5,
                          ),
                        ),
                      ),
                      items: _suppliers
                          .map(
                            (s) => DropdownMenuItem(value: s, child: Text(s)),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => _selectedSupplier = v),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Issue Date
                  _buildLabel('Issue Date *'),
                  _buildTextField(controller: _issueDateController),
                  const SizedBox(height: 14),

                  // Expected Delivery
                  _buildLabel('Expected Delivery'),
                  _buildTextField(controller: _expectedDeliveryController),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card 2: Line Items
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFBDCABF), width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Line Items',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF181D19),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _lineItems.add({
                                'product': 'New Line Item',
                                'sku': 'SKU-NEW',
                              });
                            });
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.add,
                                size: 16,
                                color: Color(0xFF006C44),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Add Item',
                                style: TextStyle(
                                  fontFamily: AppTypography.primaryFont,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF006C44),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Table Header
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    color: const Color(0xFFF4F7F4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'PRODUCT',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B7280),
                            letterSpacing: 0.3,
                          ),
                        ),
                        Text(
                          'SKU',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6B7280),
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Items List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _lineItems.length,
                    separatorBuilder: (_, index) => const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFE5E7EB),
                    ),
                    itemBuilder: (context, index) {
                      final item = _lineItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      item['product']!,
                                      style: const TextStyle(
                                        fontFamily: AppTypography.primaryFont,
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF181D19),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 16,
                                    color: Color(0xFF6B7280),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item['sku']!,
                              style: const TextStyle(
                                fontFamily: AppTypography.primaryFont,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card 3: Order Summary
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF6FBF4),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFBDCABF), width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(
                      fontFamily: AppTypography.primaryFont,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF181D19),
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildSummaryRow(
                    label: 'Items Subtotal (20)',
                    value: '\$2,186.00',
                  ),
                  const SizedBox(height: 10),
                  _buildSummaryRow(
                    label: 'Discount (5%)',
                    value: '-\$109.30',
                    valueColor: const Color(0xFF006C44),
                  ),
                  const SizedBox(height: 10),
                  _buildSummaryRow(
                    label: 'Tax (8.5%)',
                    value: '\$176.51',
                  ),
                  const SizedBox(height: 10),
                  _buildSummaryRow(
                    label: 'Shipping',
                    value: '\$250.00',
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          'Grand Total',
                          style: TextStyle(
                            fontFamily: AppTypography.primaryFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF181D19),
                          ),
                        ),
                      ),
                      Text(
                        r'$2,503.21',
                        style: TextStyle(
                          fontFamily: AppTypography.primaryFont,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF006C44),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: AppTypography.primaryFont,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF181D19),
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        fontFamily: AppTypography.primaryFont,
        fontSize: 14,
        color: Color(0xFF181D19),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFBDCABF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFBDCABF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF006C44), width: 1.5),
        ),
      ),
    );
  }

  Widget _buildSummaryRow({
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: AppTypography.primaryFont,
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4B5563),
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: AppTypography.primaryFont,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: valueColor ?? const Color(0xFF181D19),
          ),
        ),
      ],
    );
  }
}
