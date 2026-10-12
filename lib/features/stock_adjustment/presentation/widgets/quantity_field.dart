import 'package:flutter/material.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/utils/validators.dart';

class QuantityField extends StatelessWidget {
  final TextEditingController? controller;

  const QuantityField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: 'Adjustment Quantity (+/-) *',
      hint: 'e.g. 10 or -5',
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(signed: true),
      validator: (v) => Validators.number(v, 'Quantity'),
    );
  }
}
