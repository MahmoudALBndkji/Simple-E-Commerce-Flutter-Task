import 'package:flutter/material.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';

class CustomProductItemCard extends StatelessWidget {
  const CustomProductItemCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: primaryColor.withValues(alpha: 0.7),
          width: 1.5,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.blue,
        ),
      ),
    );
  }
}
