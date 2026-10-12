import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String role;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.person, size: 48, color: Colors.white),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(email, style: const TextStyle(color: AppColors.textSecondary)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(25),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            role,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
