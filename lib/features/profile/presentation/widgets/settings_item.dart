import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final Widget trailing;

  const SettingsItem({super.key, required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 15)),
          trailing,
        ],
      ),
    );
  }
}
