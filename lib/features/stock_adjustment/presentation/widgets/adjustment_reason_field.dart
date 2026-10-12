import 'package:flutter/material.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/utils/validators.dart';

class AdjustmentReasonField extends StatelessWidget {
  final TextEditingController? controller;

  const AdjustmentReasonField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: 'Reason for Adjustment *',
      hint: 'e.g., Cycle count correction, damaged goods, received shipment',
      controller: controller,
      maxLines: 3,
      validator: (v) => Validators.required(v, 'Reason for Adjustment'),
    );
  }
}
