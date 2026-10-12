import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

class FormLabel extends StatelessWidget {
  final String text;
  final bool isRequired;

  const FormLabel({super.key, required this.text, this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: AppColors.textPrimary,
        ),
        children: [
          if (isRequired)
            const TextSpan(
              text: ' *',
              style: TextStyle(color: AppColors.error),
            ),
        ],
      ),
    );
  }
}
