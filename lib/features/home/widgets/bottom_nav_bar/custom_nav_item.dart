import 'package:flutter/material.dart';

class CustomNavItem extends StatelessWidget {
  final bool isSelected;
  final IconData icon;

  const CustomNavItem(
      {super.key, required this.isSelected, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color:
              isSelected ? Colors.white : Colors.white.withValues(alpha: 0.65),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
